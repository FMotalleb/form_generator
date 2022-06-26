import 'package:isar/isar.dart';

import '../../../../core/contracts/interfaces/data_source/db_data_source_base.dart';
import '../../../../core/models_and_entities/database_models/isar/isar_form_models/field_model.dart';
import '../../../../core/models_and_entities/database_models/isar/isar_form_models/form_model.dart';
import '../../../../core/models_and_entities/models/form_models/form_model.dart';

class IsarFormDbDataSource implements BaseDataSource<FormModel> {
  final Isar _isar;
  IsarFormDbDataSource({required Isar isar}) : _isar = isar;

  @override
  Future<void> deleteItem(FormModel input) async {
    final isarModel = input.asIsarModel;
    await _isar.writeTxn(() async {
      isarModel.isarFields.clear();
      return isarModel.isarFields.save();
    });

    for (final field in input.fields) {
      await _isar.writeTxn(
        () async {
          await _isar.isarFormFields.buildQuery(
            whereClauses: [
              IdWhereClause.equalTo(value: field.id),
            ],
          ).deleteFirst();
        },
      );
    }

    await _isar.writeTxn(
      () async {
        final items = _isar.isarFormModels.buildQuery(
          whereClauses: [
            IdWhereClause.equalTo(value: input.id),
          ],
        );

        await items.deleteFirst();
      },
    );
  }

  @override
  Future<List<FormModel>> getAllItems() async {
    final items = await _isar.isarFormModels.where().findAll();
    for (final item in items) {
      await item.isarFields.load();
      final sortedProps = item.isarFields.toList();
      sortedProps.sort((a, b) => a.index.compareTo(b.index));
      item.fields = sortedProps.toSet();
    }
    return items.map((e) => e.castToModel()).toList();
  }

  @override
  Future<FormModel?> getItemById(int id) async {
    final item = await _isar.isarFormModels.buildQuery<IsarFormModel>(
      whereClauses: [
        IdWhereClause.equalTo(value: id),
      ],
    ).findFirst();

    if (item != null) {
      await item.isarFields.load();
      item.fields = item.isarFields.toSet();
    }
    return item?.castToModel();
  }

  @override
  Future<void> update(FormModel input) => write(input);

  @override
  Future<int> write(FormModel input) async {
    final placeHolder = input.asIsarModel;

    final currentItem = await getItemById(input.id);
    print('deleting');
    if (currentItem != null) {
      await deleteItem(currentItem);
    }
    print('inserting item');
    final formId = await _isar.writeTxn(
      () async {
        return _isar.isarFormModels.put(
          placeHolder,
        );
      },
    );
    print('inserting fields');
    if (placeHolder.isarFields.isNotEmpty) {
      final fields = placeHolder.isarFields.toList();

      await _isar.writeTxn(
        () async {
          await _isar.isarFormFields.putAll(
            fields,
          );
        },
      );
    }
    print('saving links');
    await _isar.writeTxn(() async {
      await placeHolder.isarFields.save();
    });
    return formId;
  }

  @override
  Future<void> deleteAllItems() async {
    await _isar.writeTxn(
      () async {
        await _isar.clear();
      },
    );
    // await _isar.writeTxn(
    //   () async {
    //     await _isar.isarFormModels.where().deleteAll();
    //   },
    // );
  }
}
