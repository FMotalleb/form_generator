import 'package:equatable/equatable.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecases.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
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
    try {
      if (params == null) {
        throw Exception(
          'params cannot be null',
        );
      }
      await _repository.addForm(
        params,
      );
      return const DataSnapHandler<bool>.done(
        data: true,
        sender: AddNewFormUseCases,
      );
    } catch (e, st) {
      return DataSnapHandler.error(
        exception: e,
        sender: st,
      );
    }
  }

  @override
  FormManagerInterface get repository => _repository;
}
