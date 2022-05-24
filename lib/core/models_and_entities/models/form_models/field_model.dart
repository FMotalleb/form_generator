import 'dart:convert';

import '../../../contracts/enums/form_enums/field_types.dart';
import '../../../contracts/interfaces/base_model/base_model.dart';
import '../../database_models/isar/isar_form_models/field_model.dart';
import '../../entities/form_entities/field_entity.dart';
import '../../entities/form_entities/form_entity.dart';

// ignore: must_be_immutable
class FormFieldModel extends FormFieldEntity implements IModel {
  FormFieldModel({
    required super.id,
    required super.index,
    super.key = '',
    super.type = FieldType.number,
    super.label = '',
    super.hint = '',
    super.error = '',
    super.internalValidators = '',
  });

  @override
  IsarFormField castToIsarModel() => IsarFormField(
        id: id,
        index: index,
        key: key,
        type: type,
        label: label,
        hint: hint,
        error: error,
        internalValidators: internalValidators,
      );
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item_index': index,
      'key': key,
      'type': type.toMap(),
      'label': label,
      'hint': hint,
      'error': error,
      'internalValidators': internalValidators,
    };
  }

  @override
  factory FormFieldModel.fromMap(Map<String, dynamic> map) {
    return FormFieldModel(
      index: map['item_index'] as int,
      id: map['id'] as int,
      key: (map['key'] ?? '').toString(),
      type: FieldType.fromMap(map['type'].toString()),
      label: (map['label'] ?? '').toString(),
      hint: (map['hint'] ?? '').toString(),
      error: (map['error'] ?? '').toString(),
      internalValidators: (map['internalValidators'] ?? '').toString(),
    );
  }
  @override
  String toJson() => json.encode(toMap());
  @override
  factory FormFieldModel.fromJson(String source) => FormFieldModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
  @override
  factory FormFieldModel.fromEntity(FormFieldEntity entity) {
    return FormFieldModel(
      index: entity.index,
      id: entity.id,
      key: entity.key,
      type: entity.type,
      label: entity.label,
      hint: entity.hint,
      error: entity.error,
      internalValidators: entity.internalValidators,
    );
  }
  @override
  FormFieldEntity castToEntity() {
    return FormFieldEntity(
      id: id,
      key: key,
      index: index,
      type: type,
      label: label,
      hint: hint,
      error: error,
      internalValidators: internalValidators,
    );
  }
}
