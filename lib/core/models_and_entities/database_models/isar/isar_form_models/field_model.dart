import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import '../../../../contracts/typedefs/form_enums/field_types.dart';
import '../../../models/form_models/field_model.dart';
import '../type_converter/field_type_converter.dart';

part 'field_model.g.dart';

@Collection()
// ignore: must_be_immutable
class IsarFormField extends FormFieldModel with EquatableMixin {
  @Id()
  int? id;
  @override
  @FieldTypeConverter()
  FieldType type;
  FormFieldModel get asModel => FormFieldModel(
        key: key,
        type: type,
        label: label,
        hint: hint,
        error: error,
        isValid: isValid,
      );
  IsarFormField({
    this.id,
    super.key = '',
    this.type = FieldType.int,
    super.label = '',
    super.hint = '',
    super.error = '',
    super.isValid = '',
  });
}
