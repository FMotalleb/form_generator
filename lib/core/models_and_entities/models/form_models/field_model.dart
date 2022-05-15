import 'dart:convert';
import '../../../contracts/typedefs/form_enums/field_types.dart';
import '../../database_models/isar/isar_form_models/field_model.dart';
import '../../entities/form_entities/field_entity.dart';
import '../base_model/base_model.dart';

// ignore: must_be_immutable
class FormFieldModel extends FormField implements BaseModel {
  FormFieldModel({
    super.key = '',
    super.type = FieldType.int,
    super.label = '',
    super.hint = '',
    super.error = '',
    super.isValid = '',
  });
  @override
  IsarFormField get asIsarModel => IsarFormField(
        key: key,
        type: type,
        label: label,
        hint: hint,
        error: error,
        isValid: isValid,
      );
  @override
  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'type': type.toMap(),
      'label': label,
      'hint': hint,
      'error': error,
      'isValid': isValid,
    };
  }

  @override
  factory FormFieldModel.fromMap(Map<String, dynamic> map) {
    return FormFieldModel(
      key: (map['key'] ?? '').toString(),
      type: FieldType.fromMap(map['type'].toString()),
      label: (map['label'] ?? '').toString(),
      hint: (map['hint'] ?? '').toString(),
      error: (map['error'] ?? '').toString(),
      isValid: (map['isValid'] ?? '').toString(),
    );
  }
  @override
  String toJson() => json.encode(toMap());
  @override
  factory FormFieldModel.fromJson(String source) => FormFieldModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
  @override
  factory FormFieldModel.fromEntity(FormField entity) {
    return FormFieldModel(
      key: entity.key,
      type: entity.type,
      label: entity.label,
      hint: entity.hint,
      error: entity.error,
      isValid: entity.isValid,
    );
  }
}