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
      (isar) async => isar.isarFormModels.buildQuery<IsarFormModel>().findAll(),
    );
    for (final item in items) {
      await item.isarFields.load();
      item.fields = item.isarFields.toSet();
      print(item.isarFields);
    }
    return items;
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
      await item.isarFields.load();
      item.fields = item.isarFields.toSet();
    }
    return item;
  }

  @override
  Future<void> update(FormModel input) async {
    final placeHolder = input.asIsarModel;
    await _isar.writeTxn(
      (isar) => isar.isarFormModels.put(
        placeHolder,
        replaceOnConflict: true,
        saveLinks: true,
      ),
    );
    // if (item != null) {
    //   await item.isarFields.load();
    //   item.fields = item.isarFields.toSet();
    // }
  }

  @override
  Future<int> write(FormModel input) {
    return _isar.writeTxn(
      (isar) => isar.isarFormModels.put(
        input.asIsarModel,
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

  // Future<T> write<T>(
  //   Future<T> Function(Isar) callback, {
  //   bool silent = false,
  // }) =>
  //     _isar.writeTxn(
  //       callback,
  //       silent: silent,
  //     );
  // Future<T> read<T>(
  //   Future<T> Function(Isar) callback,
  // ) =>
  //     _isar.txn(
  //       callback,
  //     );
  // Future<void> clean() => _isar.clear();
}
