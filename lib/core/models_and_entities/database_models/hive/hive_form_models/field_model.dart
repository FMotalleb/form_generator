import 'package:hive_flutter/adapters.dart';

import '../../../../contracts/enums/form_enums/field_types.dart';
import '../../../models/form_models/field_model.dart';

part 'field_model.g.dart';

@HiveType(typeId: 1)
class HiveFormField extends FormFieldModel with HiveObjectMixin {
  @HiveField(0)
  @override
  int id;
  @HiveField(1)
  @override
  int index;

  @HiveField(3)
  @override
  FieldType type;
  @HiveField(4)
  @override
  String label;
  @HiveField(5)
  @override
  String hint;
  @HiveField(6)
  @override
  String error;
  @HiveField(7)
  @override
  String internalValidators;
  HiveFormField({
    required this.id,
    required this.index,
    required this.type,
    required this.label,
    required this.hint,
    required this.error,
    required this.internalValidators,
  }) : super(
          id: id,
          index: index,
          error: error,
          hint: hint,
          label: label,
          type: type,
          internalValidators: internalValidators,
        );
}
