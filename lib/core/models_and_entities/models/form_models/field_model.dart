import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../contracts/typedefs/form_enums/field_types.dart';
import '../../database_models/isar/isar_form_models/field_model.dart';
import '../../entities/form_entities/field_entity.dart';

// ignore: must_be_immutable
class FormFieldModel extends FormField with EquatableMixin {
  FormFieldModel({
    super.key = '',
    super.type = FieldType.int,
    super.label = '',
    super.hint = '',
    super.error = '',
    super.isValid = '',
  });
  IsarFormField get asIsarModel => IsarFormField(
        key: key,
        type: type,
        label: label,
        hint: hint,
        error: error,
        isValid: isValid,
      );
  @override
  List<Object?> get props => [key, type, label, hint, error, isValid];

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

  String toJson() => json.encode(toMap());

  factory FormFieldModel.fromJson(String source) => FormFieldModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
