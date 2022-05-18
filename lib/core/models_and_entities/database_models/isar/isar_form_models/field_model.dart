import 'package:equatable/equatable.dart';
import 'package:hemend/extensions/equalizer/equalizer.dart';
import 'package:isar/isar.dart';

import '../../../../contracts/typedefs/form_enums/field_types.dart';
import '../../../models/form_models/field_model.dart';
import '../type_converter/field_type_converter.dart';

part 'field_model.g.dart';

@Collection()
// ignore: must_be_immutable
class IsarFormField extends FormFieldModel {
  @override
  @FieldTypeConverter()
  FieldType type;
  @Id()
  @override
  int id;
  FormFieldModel castToModel() => this;
  IsarFormField({
    required this.id,
    super.key = '',
    required super.index,
    this.type = FieldType.number,
    super.label = '',
    super.hint = '',
    super.error = '',
    super.internalValidators = '',
  }) : super(id: id);

  // @override
  // List get equalCheckItems => equalCheckItems;
}
