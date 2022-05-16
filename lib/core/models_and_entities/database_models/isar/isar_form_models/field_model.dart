import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import '../../../../contracts/typedefs/form_enums/field_types.dart';
import '../../../entities/form_entities/field_entity.dart';
import '../../../entities/form_entities/form_entity.dart';
import '../../../models/form_models/field_model.dart';
import '../type_converter/field_type_converter.dart';

part 'field_model.g.dart';

@Collection()
// ignore: must_be_immutable
class IsarFormField extends FormFieldModel with EquatableMixin {
  @override
  @FieldTypeConverter()
  FieldType type;

  FormFieldModel get asModel => FormFieldModel(
        id: id,
        key: key,
        index: index,
        type: type,
        label: label,
        hint: hint,
        error: error,
        isValid: isValid,
      );
  IsarFormField({
    required super.id,
    super.key = '',
    required super.index,
    this.type = FieldType.int,
    super.label = '',
    super.hint = '',
    super.error = '',
    super.isValid = '',
  });
}
