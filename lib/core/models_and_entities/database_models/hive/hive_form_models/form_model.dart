import 'package:hive/hive.dart';

import '../../../entities/form_entities/field_entity.dart';
import '../../../models/form_models/form_model.dart';

@HiveType(typeId: 0)
class HiveFormModel extends FormModel {
  @HiveField(0)
  @override
  int id;
  @HiveField(1)
  @override
  int index;
  @HiveField(2)
  @override
  String title;
  @HiveField(3)
  @override
  String description;
  // @HiveField(4)
  // @override
  // Set<FormFieldEntity> fields;

  HiveFormModel({
    required this.id,
    required this.index,
    required this.title,
    required this.description,
    super.fields = const {},
  }) : super(
          id: id,
          index: index,
          title: title,
          description: description,
          // fields: fields,
        );
}
