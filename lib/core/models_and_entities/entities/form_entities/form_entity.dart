import '../../../contracts/interfaces/base_entity/base_entity.dart';
import 'field_entity.dart';

// ignore: must_be_immutable
class FormEntity extends IEntity {
  int id;
  int index;
  String title;
  String description;
  List<FormFieldEntity> fields;
  FormEntity({
    required this.id,
    required this.index,
    this.title = '',
    this.description = '',
    this.fields = const [],
  });
  @override
  List<Object> get equalCheckItems => [title, description, ...fields];
}
