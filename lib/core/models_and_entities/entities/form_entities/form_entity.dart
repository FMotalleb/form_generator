import 'package:equatable/equatable.dart';

import 'field_entity.dart';

// ignore: must_be_immutable
class Form with EquatableMixin {
  String title;
  String description;
  final Set<FormField> fields;
  Form({
    this.title = '',
    this.description = '',
    this.fields = const {},
  });
  @override
  List<Object> get props => [title, description, fields];
}
