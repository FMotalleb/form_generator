// ignore_for_file: lines_longer_than_80_chars

import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecase.dart';
import '../../../../core/contracts/interfaces/data_source/db_data_source_base.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../../../../core/models_and_entities/models/form_models/form_model.dart';
import '../../domain/repositories/form_manager_interface.dart';

class FormManagerRepository implements FormManagerInterface {
  final IDataSource<FormModel> _formDbDataSource;
  FormManagerRepository(this._formDbDataSource);
  @override
  Future<void> addForm(FormEntity form) => _formDbDataSource.write(
        FormModel.fromEntity(form),
      );

  @override
  Future<void> deleteForm(FormEntity form) => _formDbDataSource.deleteItem(FormModel.fromEntity(form));

  @override
  Future<List<FormEntity>?> getAllForms() async =>
      (await _formDbDataSource.getAllItems())?.map((e) => e.castToEntity()).toList();

  @override
  Future<FormEntity?> getFormById(int id) async => (await _formDbDataSource.getItemById(
        id,
      ))
          ?.castToEntity();

  @override
  Future<void> updateForm(FormEntity form) => _formDbDataSource.update(
        FormModel.fromEntity(form),
      );

  @override
  Future<void> deleteAllForms() async {
    _formDbDataSource.deleteAllItems();
  }

  @override
  String get moduleName => 'form manager repository';

  @override
  Future<DataSnapHandler<T>> executeRequest<T, R>(IUsecase<T, R> usecase, R params) {
    return usecase.execute(params);
  }
}
