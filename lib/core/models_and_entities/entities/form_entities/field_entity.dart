import 'package:isar/isar.dart';

import '../../../../../core/contracts/typedefs/form_enums/field_types.dart';
import '../../../contracts/interfaces/base_entity/base_entity.dart';

// ignore: must_be_immutable
class FormFieldEntity extends BaseEntity {
  int id;
  int index;
  String key;
  FieldType type;
  String label;
  String hint;
  String error;
  String isValid;

  FormFieldEntity({
    required this.id,
    required this.key,
    required this.index,
    this.type = FieldType.int,
    required this.label,
    required this.hint,
    required this.error,
    required this.isValid,
  });

  @override
  List<Object?> get props => [id, key, type, label, hint, error, isValid];
}
