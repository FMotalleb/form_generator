import 'package:isar/isar.dart';

import '../../../contracts/interfaces/base_entity/base_entity.dart';
import 'field_entity.dart';

// ignore: must_be_immutable
class FormEntity extends BaseEntity {
  @Id()
  int id;
  String title;
  String description;
  Set<FormFieldEntity> fields;
  FormEntity({
    required this.id,
    this.title = '',
    this.description = '',
    this.fields = const {},
  });
  @override
  List<Object> get props => [title, description, fields];
}
