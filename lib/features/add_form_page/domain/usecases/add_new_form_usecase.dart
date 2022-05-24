import 'package:equatable/equatable.dart';
import 'package:hemend/debug/error_handler.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecase.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../repositories/form_manager_interface.dart';

class AddNewFormUseCase with EquatableMixin implements IUsecase<void, FormEntity> {
  final IFormManager _repository;
  const AddNewFormUseCase(
    this._repository,
  );

  @override
  List<Object?> get props => [_repository];

  @override
  Future<DataSnapHandler<void>> invoke([FormEntity? params]) async {
    try {
      if (params == null) {
        throw ErrorHandler('params cannot be null', {
          ErrorType.typeError,
        });
      }
      await _repository.addForm(
        params,
      );
      return const DataSnapHandler<bool>.done(
        data: true,
        sender: AddNewFormUseCase,
      );
    } catch (e, st) {
      return DataSnapHandler.error(
        exception: e,
        sender: st,
      );
    }
  }

  @override
  String get moduleName => 'add new form usecase';
}
