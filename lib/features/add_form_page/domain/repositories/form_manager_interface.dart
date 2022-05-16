import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';

abstract class FormManagerInterface {
  Future<void> addForm(FormEntity form);
  Future<void> updateForm(FormEntity form);
  Future<void> deleteForm(int id);
  Future<void> deleteAll();
  Future<List<FormEntity>> getAllForms();
  Future<FormEntity?> getFormById(int id);
}
