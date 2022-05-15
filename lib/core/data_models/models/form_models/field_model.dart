import 'package:equatable/equatable.dart';
import '../../../contracts/typedefs/form_enums/field_types.dart';

class FormField extends Equatable {
  String key;
  FieldType type;
  String label;
  String hint;
  String error;
  String isValid;

  FormField({
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
