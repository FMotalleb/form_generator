import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import '../../../contracts/typedefs/form_enums/field_types.dart';
import '../../models/form_models/field_model.dart';
part 'field_model.g.dart';

@Collection()
// ignore: must_be_immutable
class IsarFormField extends FormField with EquatableMixin {
  @override
  @Id()
  int? id;

  IsarFormField({
    this.id,
    super.key = '',
    super.type = FieldType.int,
    super.label = '',
    super.hint = '',
    super.error = '',
    super.isValid = '',
  });
}
