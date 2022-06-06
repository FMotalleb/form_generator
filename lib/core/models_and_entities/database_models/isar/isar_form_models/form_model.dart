import 'package:isar/isar.dart';

import '../../../entities/form_entities/form_entity.dart';
import '../../../models/form_models/field_model.dart';
import '../../../models/form_models/form_model.dart';
import 'field_model.dart';
part 'form_model.g.dart';

@Collection()
// ignore: must_be_immutable
class IsarFormModel extends FormModel {
  IsarLinks<IsarFormField> isarFields = IsarLinks<IsarFormField>();

  @Id()
  @override
  int id;
  IsarFormModel({
    required this.id,
    required super.index,
    required super.title,
    required super.description,
    super.fields = const [],
  }) : super(
          id: id,
        ) {
    isarFields.addAll(
      fields.map((e) => FormFieldModel.fromEntity(e).castToIsarModel()),
    );
  }
  @override
  String toString() => '${super.toString()} $isarFields';

  @override
  FormEntity castToEntity() {
    return FormModel.fromEntity(this).castToEntity();
  }

  FormModel castToModel() => FormModel(
        id: id,
        title: title,
        index: index,
        description: description,
        fields: isarFields.map((e) => e.castToModel().castToEntity()).toList(),
      );
}
