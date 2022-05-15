import '../../../contracts/interfaces/base_entity/base_entity.dart';
import 'field_entity.dart';

// ignore: must_be_immutable
class FormEntity extends BaseEntity {
  String title;
  String description;
  final Set<FormField> fields;
  FormEntity({
    this.title = '',
    this.description = '',
    this.fields = const {},
  });
  @override
  List<Object> get props => [title, description, fields];
}
