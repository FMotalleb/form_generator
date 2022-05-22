import '../../../../core/contracts/interfaces/base_repository/base_repository.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';

abstract class IFormManager implements IRepository {
  Future<void> addForm(FormEntity form);
  Future<void> updateForm(FormEntity form);
  Future<void> deleteForm(FormEntity form);
  Future<void> deleteAllForms();
  Future<List<FormEntity>?> getAllForms();
  Future<FormEntity?> getFormById(int id);
}
