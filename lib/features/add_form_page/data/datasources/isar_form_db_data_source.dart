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
    await _isar.writeTxn((isar) async {
      isarModel.isarFields.clear();
      await isarModel.isarFields.save();
    });
    for (final field in input.fields) {
      await _isar.writeTxn(
        (isar) async {
          await isar.isarFormFields.buildQuery(
            whereClauses: [
              IdWhereClause.equalTo(value: field.id),
            ],
          ).deleteAll();
        },
      );
    }
    await _isar.writeTxn(
      (isar) async {
        await isar.isarFormModels.buildQuery(
          whereClauses: [
            IdWhereClause.equalTo(value: input.id),
          ],
        ).deleteAll();
      },
    );
  }

  @override
  Future<List<FormModel>> getAllItems() async {
    final items = await _isar.txn(
      (isar) async {
        return isar.isarFormModels.buildQuery<IsarFormModel>(
          sortBy: [
            const SortProperty(property: 'index', sort: Sort.asc),
          ],
        ).findAll();
      },
    );
    for (final item in items) {
      await _isar.txn((isar) async {
        await item.isarFields.load();
      });
      final sortedProps = item.isarFields.toList();
      sortedProps.sort((a, b) => a.index.compareTo(b.index));
      item.fields = sortedProps.toSet();
    }
    return items.map((e) => e.castToModel()).toList();
  }

  @override
  Future<FormModel?> getItemById(int id) async {
    final item = await _isar.txn(
      (isar) async {
        return isar.isarFormModels.buildQuery<IsarFormModel>(
          whereClauses: [
            IdWhereClause.equalTo(value: id),
          ],
        ).findFirst();
      },
    );

    if (item != null) {
      await _isar.txn((isar) async {
        await item.isarFields.load();
      });
      item.fields = item.isarFields.toSet();
    }
    return item?.castToModel();
  }

  @override
  Future<void> update(FormModel input) => write(input);

  @override
  Future<int> write(FormModel input) async {
    final placeHolder = input.asIsarModel;
    print('step1');
    final currentItem = await getItemById(input.id);
    print('step2');
    if (currentItem != null) {
      print('found item');
      await deleteItem(currentItem);
    }
    print('step3');
    if (placeHolder.isarFields.isNotEmpty) {
      final fields = placeHolder.isarFields.toList();
      // if (currentItem != null) {
      //   fields.removeWhere(
      //     (element) => currentItem.fields.map((e) => e.id)
      // .contains(element.id),
      //   );
      // }
      await _isar.writeTxn(
        (isar) async {
          await _isar.isarFormFields.putAll(
            fields,
            replaceOnConflict: false,
            saveLinks: true,
          );
        },
      );
    }

    print('step4');
    final formId = await _isar.writeTxn(
      (isar) async {
        return isar.isarFormModels.put(
          placeHolder,
          saveLinks: true,
        );
      },
    );
    print('step5');
    await _isar.writeTxn((isar) async {
      await placeHolder.isarFields.save();
    });
    print('step6');
    return formId;
  }

  @override
  Future<void> deleteAllItems() async {
    await _isar.writeTxn(
      (isar) async {
        await isar.isarFormFields.buildQuery().deleteAll();
      },
    );
    await _isar.writeTxn(
      (isar) async {
        await isar.isarFormModels.buildQuery().deleteAll();
      },
    );
  }
}
