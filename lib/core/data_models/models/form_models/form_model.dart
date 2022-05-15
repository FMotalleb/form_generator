import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'field_model.dart';

// ignore: must_be_immutable
class FormModel extends Equatable {
  String title;
  String description;
  List<FormField> fields;
  FormModel({
    this.title = '',
    this.description = '',
    this.fields = const [],
  });
  @override
  List<Object?> get props => [title, description, fields];
}
