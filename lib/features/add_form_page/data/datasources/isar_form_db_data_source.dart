import 'package:isar/isar.dart';

import '../../../../core/contracts/interfaces/data_source/db_data_source_base.dart';
import '../../../../core/models_and_entities/database_models/isar/isar_form_models/field_model.dart';
import '../../../../core/models_and_entities/database_models/isar/isar_form_models/form_model.dart';
import '../../../../core/models_and_entities/models/form_models/form_model.dart';

class IsarFormDbDataSource implements BaseDataSource<FormModel> {
  final Isar _isar;
  IsarFormDbDataSource({required Isar isar}) : _isar = isar;

  @override
  Future<void> deleteItem(int id) async {
    await _isar.writeTxn(
      (isar) => isar.isarFormModels.buildQuery(
        whereClauses: [
          IdWhereClause.equalTo(value: id),
        ],
      ).deleteAll(),
    );
  }

  @override
  Future<List<FormModel>> getAllItems() async {
    final items = await _isar.txn(
      (isar) async => isar.isarFormModels.buildQuery<IsarFormModel>(
        sortBy: [
          const SortProperty(property: 'index', sort: Sort.asc),
        ],
      ).findAll(),
    );
    for (final item in items) {
      await _isar.txn((isar) => item.isarFields.load());
      final sortedProps = item.isarFields.toList();
      sortedProps.sort((a, b) => a.index.compareTo(b.index));
      item.fields = sortedProps.toSet();
    }
    return items.map((e) => e.castToModel()).toList();
  }

  @override
  Future<FormModel?> getItemById(int id) async {
    final item = await _isar.txn(
      (isar) => isar.isarFormModels.buildQuery<IsarFormModel>(
        whereClauses: [
          IdWhereClause.equalTo(value: id),
        ],
      ).findFirst(),
    );

    if (item != null) {
      await _isar.txn((isar) => item.isarFields.load());
      item.fields = item.isarFields.toSet();
    }
    return item?.castToModel();
  }

  @override
  Future<void> update(FormModel input) async {
    final placeHolder = input.asIsarModel;

    await _isar.writeTxn(
      (isar) => isar.isarFormModels.put(
        placeHolder,
      ),
    );
    await _isar.writeTxn(
      (isar) => _isar.isarFormFields.putAll(
        placeHolder.isarFields.toList(),
      ),
    );
    await _isar.writeTxn((isar) => placeHolder.isarFields.save());
  }

  @override
  Future<int> write(FormModel input) async {
    final placeHolder = input.asIsarModel;
    await _isar.writeTxn(
      (isar) => _isar.isarFormFields.putAll(
        placeHolder.isarFields.toList(),
      ),
    );
    return _isar.writeTxn(
      (isar) => isar.isarFormModels.put(
        placeHolder,
        replaceOnConflict: false,
        saveLinks: true,
      ),
    );
  }

  @override
  Future<void> deleteAllItems() async {
    await _isar.writeTxn(
      (isar) => isar.isarFormFields.buildQuery().deleteAll(),
    );
    await _isar.writeTxn(
      (isar) => isar.isarFormModels.buildQuery().deleteAll(),
    );
  }
}
