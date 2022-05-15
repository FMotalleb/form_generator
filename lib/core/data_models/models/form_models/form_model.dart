import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:form_generator/core/data_models/database_models/isar/isar_form_models/field_model.dart';
import 'package:form_generator/core/data_models/database_models/isar/isar_form_models/form_model.dart';
import 'package:isar/isar.dart';

import 'field_model.dart';

// ignore: must_be_immutable
class FormModel extends Equatable {
  String title;
  String description;
  final Set<FormField> fields;
  FormModel({
    this.title = '',
    this.description = '',
    this.fields = const {},
  });
  @override
  List<Object> get props => [title, description, fields];

  FormModel copyWith({
    String? title,
    String? description,
    Set<FormField>? fields,
  }) {
    return FormModel(
      title: title ?? this.title,
      description: description ?? this.description,
      fields: fields ?? this.fields,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'fields': fields.map((x) => x.toMap()).toList(),
    };
  }

  IsarFormModel get asIsarModel => IsarFormModel(
        title: title,
        description: description,
        fields: IsarLinks<IsarFormField>()
          ..addAll(
            fields.map((e) => e.asIsarModel),
          ),
      );
  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      title: (map['title'] ?? '').toString(),
      description: (map['description'] ?? '').toString(),
      fields: Set<FormField>.from(
        ((map['fields'] ?? []) as List<Map<String, dynamic>>).map(
          FormField.fromMap,
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormModel.fromJson(String source) => FormModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'FormModel(title: $title, description: $description, fields: $fields)';
}
