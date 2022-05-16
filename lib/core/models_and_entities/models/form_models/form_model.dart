import 'dart:convert';

import 'package:isar/isar.dart';

import '../../../contracts/interfaces/base_model/base_model.dart';
import '../../database_models/isar/isar_form_models/field_model.dart';
import '../../database_models/isar/isar_form_models/form_model.dart';
import '../../entities/form_entities/field_entity.dart';
import '../../entities/form_entities/form_entity.dart';
import 'field_model.dart';

// ignore: must_be_immutable
class FormModel extends FormEntity implements BaseModel {
  FormModel({
    required super.id,
    super.title = '',
    super.description = '',
    super.fields = const {},
  });
  @override
  List<Object> get props => [title, description, fields];

  FormModel copyWith({
    String? title,
    String? description,
    Set<FormFieldModel>? fields,
  }) {
    return FormModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      fields: fields ?? this.fields,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'fields': fields
          .map(
            (x) => FormFieldModel.fromEntity(x).toMap(),
          )
          .toList(),
    };
  }

  @override
  IsarFormModel get asIsarModel => IsarFormModel(
        id: id,
        title: title,
        description: description,
        fields: IsarLinks<IsarFormField>()
          ..addAll(
            fields.map((e) => FormFieldModel.fromEntity(e).asIsarModel),
          ),
      );
  @override
  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      id: map['id'] as int,
      title: (map['title'] ?? '').toString(),
      description: (map['description'] ?? '').toString(),
      fields: Set<FormFieldModel>.from(
        ((map['fields'] ?? []) as List<Map<String, dynamic>>).map(
          FormFieldModel.fromMap,
        ),
      ),
    );
  }

  @override
  String toJson() => json.encode(toMap());
  @override
  factory FormModel.fromJson(String source) => FormModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
  factory FormModel.fromEntity(FormEntity entity) {
    return FormModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      fields: entity.fields
          .map(
            FormFieldModel.fromEntity,
          )
          .toSet(),
    );
  }
  @override
  // ignore: lines_longer_than_80_chars
  String toString() => 'FormModel(title: $title, description: $description, fields: $fields)';
}
