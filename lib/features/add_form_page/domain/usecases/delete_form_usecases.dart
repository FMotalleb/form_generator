import 'package:equatable/equatable.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecases.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../repositories/form_manager_interface.dart';

class DeleteFormUsecases with EquatableMixin implements BaseUsecases<void, FormEntity> {
  @override
  List<Object?> get props => [_repository];
  final FormManagerInterface _repository;
  const DeleteFormUsecases(this._repository);
  @override
  Future<void> execute([FormEntity? params]) async {
    try {
      if (params == null) {
        throw Exception(
          'params cannot be null',
        );
      }
      await _repository.deleteForm(params);
      return;
    } catch (e, st) {
      rethrow;
    }
  }

  @override
  FormManagerInterface get repository => _repository;
}
