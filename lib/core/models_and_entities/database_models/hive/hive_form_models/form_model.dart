import 'package:hive/hive.dart';

import '../../../entities/form_entities/field_entity.dart';
import '../../../models/form_models/form_model.dart';
part 'form_model.g.dart';

@HiveType(typeId: 0)
class HiveFormModel extends FormModel with HiveObjectMixin {
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
  @HiveField(4)
  @override
  List<FormFieldEntity> fields;

  HiveFormModel({
    required this.id,
    required this.index,
    required this.title,
    required this.description,
    required this.fields,
  }) : super(
          id: id,
          index: index,
          title: title,
          description: description,
          fields: fields,
        );
}
