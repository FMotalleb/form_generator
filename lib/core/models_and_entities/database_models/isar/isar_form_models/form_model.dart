import 'package:isar/isar.dart';

import '../../../entities/form_entities/form_entity.dart';
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
    super.title = '',
    super.description = '',
    Set<IsarFormField> fields = const {},
  }) : super(id: id) {
    isarFields.addAll(fields);
  }
  @override
  String toString() => '${super.toString()} $isarFields';

  @override
  FormEntity castToEntity() {
    return this;
  }

  FormModel castToModel() {
    return this;
  }
}
