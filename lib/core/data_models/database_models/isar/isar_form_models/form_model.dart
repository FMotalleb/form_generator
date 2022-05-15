import 'package:isar/isar.dart';

import '../../../models/form_models/field_model.dart';
import '../../../models/form_models/form_model.dart';
import 'field_model.dart';
part 'form_model.g.dart';

@Collection()
// ignore: must_be_immutable
class IsarFormModel extends FormModel {
  @Id()
  int? id;

  @override
  Set<FormField> get fields => isarFields.map((e) => e.asModel).toSet();
  IsarLinks<IsarFormField> isarFields = IsarLinks<IsarFormField>();

  IsarFormModel({
    this.id,
    super.title = '',
    super.description = '',
    Set<IsarFormField> fields = const {},
  }) {
    isarFields.addAll(fields);
  }
  @override
  String toString() => '${super.toString()} $isarFields';
}
