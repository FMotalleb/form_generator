import '../../../contracts/enums/form_enums/field_types.dart';
import '../../../contracts/interfaces/base_entity/base_entity.dart';

// ignore: must_be_immutable
class FormFieldEntity extends IEntity {
  int id;
  int index;
  FieldType type;
  String label;
  String hint;
  String error;
  String internalValidators;

  FormFieldEntity({
    required this.id,
    required this.index,
    required this.type,
    required this.label,
    required this.hint,
    required this.error,
    required this.internalValidators,
  });

  @override
  List<Object> get equalCheckItems => [id, type, label, hint, error, internalValidators];
}
