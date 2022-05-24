import 'package:sqflite/sqflite.dart';

import '../../../../core/contracts/interfaces/data_source/db_data_source_base.dart';
import '../../../../core/models_and_entities/models/form_models/field_model.dart';
import '../../../../core/models_and_entities/models/form_models/form_model.dart';

class SqfLiteFormDataSource implements IDataSource<FormModel> {
  final Database _sqfLiteDb;
  static const String _kFormsTableName = 'forms';
  static const String _kFieldsTableName = 'fields';
  const SqfLiteFormDataSource(
    this._sqfLiteDb,
  );
  @override
  Future<void> deleteAllItems() async {
    await _sqfLiteDb.delete(_kFieldsTableName);
    await _sqfLiteDb.delete(_kFormsTableName);
  }

  @override
  Future<void> deleteItem(FormModel input) async {
    await _sqfLiteDb.delete(_kFieldsTableName, where: 'form_id = ?', whereArgs: [input.id]);
    await _sqfLiteDb.delete(_kFormsTableName, where: 'form_id = ?', whereArgs: [input.id]);
  }

  Future<List<FormFieldModel>?> getAllFieldsFor(int formId) async {
    final items = await _sqfLiteDb.query(
      _kFieldsTableName,
      where: 'form_id = ?',
      whereArgs: [formId],
    );
    return items.map(FormFieldModel.fromMap).toList();
  }

  @override
  Future<List<FormModel>?> getAllItems() async {
    final formsMaps = await _sqfLiteDb.query(
      _kFormsTableName,
    );
    final forms = formsMaps.map(FormModel.fromMap).toList();
    for (final form in forms) {
      final fields = await getAllFieldsFor(form.id);
      if (fields != null) {
        form.fields = fields.toSet();
      }
    }
    return forms;
  }

  @override
  Future<FormModel?> getItemById(int id) async {
    final formMap = (await _sqfLiteDb.query(
      _kFormsTableName,
      where: 'form_id = ?',
      whereArgs: [id],
    ))
        .first;
    final form = FormModel.fromMap(formMap);

    final fields = await getAllFieldsFor(form.id);
    if (fields != null) {
      form.fields = fields.toSet();
    }

    return form;
  }

  @override
  String get moduleName => 'SQFLITE db FormDataSource';

  @override
  Future<void> update(FormModel input) async {
    final formMap = mapNormalizer(input.toMap());
    final fieldsMap = input.fields.map((e) => mapNormalizer(FormFieldModel.fromEntity(e).toMap(), input.id)).toList();
    formMap.remove('fields');
    try {
      await _sqfLiteDb.delete(_kFieldsTableName, where: 'form_id = ?', whereArgs: [input.id]);
    } catch (e) {
      // rethrow;
    }

    for (final field in fieldsMap) {
      await _sqfLiteDb.insert(_kFieldsTableName, field);
      // } else {
      //   await _sqfLiteDb.update(
      //     _kFieldsTableName,
      //     field,
      //     where: 'field_id = ?',
      //     whereArgs: [field['field_id']],
      //   );
      // }
    }
    await _sqfLiteDb.update(
      _kFormsTableName,
      formMap,
      where: 'form_id = ?',
      whereArgs: [input.id],
    );
  }

  @override
  Future<void> write(FormModel input) async {
    final formMap = mapNormalizer(input.toMap());
    final fieldsMap = input.fields.map((e) => mapNormalizer(FormFieldModel.fromEntity(e).toMap(), input.id)).toList();
    formMap.remove('fields');
    for (final field in fieldsMap) {
      await _sqfLiteDb.insert(
        _kFieldsTableName,
        field,
      );
    }
    await _sqfLiteDb.insert(
      _kFormsTableName,
      formMap,
    );
  }

  Map<String, dynamic> mapNormalizer(Map<String, dynamic> input, [int? overrideId]) {
    final output = Map<String, dynamic>.from(input);
    final id = overrideId ?? output.remove('id');
    output.addAll({'form_id': id});
    return output;
  }
}
