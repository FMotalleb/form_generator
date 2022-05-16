import 'package:equatable/equatable.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecases.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../../data/repositories/form_manager_repo.dart';

class GetAllItemsUsecases with EquatableMixin implements BaseUsecases<void, void> {
  final FormManagerRepo _repository;
  const GetAllItemsUsecases(
    this._repository,
  );
  @override
  Future<DataSnapHandler<List<FormEntity>>> execute([void params]) async {
    try {
      return DataSnapHandler.done(
        data: await _repository.getAllForms(),
        sender: GetAllItemsUsecases,
      );
    } catch (e, st) {
      return DataSnapHandler.error(
        exception: e,
        sender: st,
      );
    }
  }

  @override
  FormManagerRepo get repository => _repository;
  @override
  List<Object?> get props => [_repository];
}
