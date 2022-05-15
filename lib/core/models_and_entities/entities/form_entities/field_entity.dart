import '../../../../../core/contracts/typedefs/form_enums/field_types.dart';
import '../base_entity/base_entity.dart';

// ignore: must_be_immutable
class FormField extends BaseEntity {
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
