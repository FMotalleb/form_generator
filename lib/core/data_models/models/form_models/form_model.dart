import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'field_model.dart';
part 'form_model.g.dart';

@Collection()
class FormModel extends Equatable {
  @Id()
  int? id;
  String title;
  String description;
  List<IsarLink<FormField>> fields;
  FormModel({
    this.id,
    this.title = '',
    this.description = '',
    this.fields = const [],
  });
  @override
  List<Object?> get props => [id, title, description, fields];
}
