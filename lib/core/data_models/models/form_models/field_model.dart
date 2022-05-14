import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import '../../../contracts/typedefs/form_enums/field_types.dart';
part 'field_model.g.dart';

@Collection()
class FormField extends Equatable {
  @Id()
  int? id;
  String key;
  FieldType type;
  String label;
  String hint;
  String error;
  String isValid;

  FormField({
    this.id,
    this.key = '',
    this.type = FieldType.int,
    this.label = '',
    this.hint = '',
    this.error = '',
    this.isValid = '',
  });

  @override
  List<Object?> get props => [key, type, label, hint, error, isValid];
}
