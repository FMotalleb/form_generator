import 'package:isar/isar.dart';

import '../../../entities/form_entities/form_entity.dart';
import '../../../models/form_models/form_model.dart';
import 'field_model.dart';
part 'form_model.g.dart';

@Collection()
// ignore: must_be_immutable
class IsarFormModel extends FormModel {
  IsarLinks<IsarFormField> isarFields = IsarLinks<IsarFormField>();

  IsarFormModel({
    required super.id,
    required super.index,
    super.title = '',
    super.description = '',
    Set<IsarFormField> fields = const {},
  }) {
    isarFields.addAll(fields);
  }
  @override
  String toString() => '${super.toString()} $isarFields';

  @override
  FormEntity castToEntity() {
    return FormEntity(
      id: id,
      index: index,
      title: title,
      description: description,
      fields: isarFields.map((e) => e.castToEntity()).toSet(),
    );
  }

  FormModel castToModel() {
    return FormModel(
      id: id,
      index: index,
      title: title,
      description: description,
      fields: isarFields.map((e) => e.castToEntity()).toSet(),
    );
  }
}
