import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:form_generator/core/data_models/database_models/isar/isar_form_models/field_model.dart';

import '../../../contracts/typedefs/form_enums/field_types.dart';

// ignore: must_be_immutable
class FormField extends Equatable {
  String key;
  FieldType type;
  String label;
  String hint;
  String error;
  String isValid;

  FormField({
    this.key = '',
    this.type = FieldType.int,
    this.label = '',
    this.hint = '',
    this.error = '',
    this.isValid = '',
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

  factory FormField.fromMap(Map<String, dynamic> map) {
    return FormField(
      key: (map['key'] ?? '').toString(),
      type: FieldType.fromMap(map['type'].toString()),
      label: (map['label'] ?? '').toString(),
      hint: (map['hint'] ?? '').toString(),
      error: (map['error'] ?? '').toString(),
      isValid: (map['isValid'] ?? '').toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormField.fromJson(String source) => FormField.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
