import 'package:equatable/equatable.dart';
import 'package:hemend/debug/error_handler.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecase.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../repositories/form_manager_interface.dart';

class EditFormUseCase with EquatableMixin implements IUsecase<void, FormEntity> {
  final IFormManager _repository;
  const EditFormUseCase(
    this._repository,
  );
  @override
  Future<DataSnapHandler<void>> execute([FormEntity? params]) async {
    try {
      if (params == null) {
        throw ErrorHandler('params cannot be null', {
          ErrorType.typeError,
        });
      }
      await _repository.updateForm(params);
      return const DataSnapHandler<bool>.done(
        data: true,
        sender: EditFormUseCase,
      );
    } catch (e, st) {
      return DataSnapHandler.error(
        exception: e,
        sender: st,
      );
    }
  }

  @override
  IFormManager get repository => _repository;
  @override
  List<Object?> get props => [_repository];

  @override
  String get moduleName => 'edit form usecase';
}
