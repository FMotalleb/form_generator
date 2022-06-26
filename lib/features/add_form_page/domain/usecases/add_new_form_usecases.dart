import 'package:equatable/equatable.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecases.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../../../../core/models_and_entities/models/form_models/form_model.dart';
import '../repositories/form_manager_interface.dart';

class AddNewFormUseCases with EquatableMixin implements BaseUsecases<void, FormEntity> {
  final FormManagerInterface _repository;
  const AddNewFormUseCases(
    this._repository,
  );

  @override
  List<Object?> get props => [_repository];

  @override
  Future<void> execute([FormEntity? params]) async {
    // print(FormModel.fromEntity(params!).toJson());
    try {
      if (params == null) {
        throw Exception(
          'params cannot be null',
        );
      }
      await _repository.addForm(
        params,
      );
      return;
    } catch (e, st) {
      rethrow;
    }
  }

  @override
  FormManagerInterface get repository => _repository;
}
