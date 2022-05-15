import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import '../../models/form_models/form_model.dart';
part 'form_model.g.dart';

@Collection()
// ignore: must_be_immutable
class IsarFormModel extends FormModel {
  @Id()
  int? id;

  IsarFormModel({
    this.id,
    super.title = '',
    super.description = '',
    super.fields = const [],
  });
}
