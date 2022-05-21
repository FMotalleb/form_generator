import 'package:equatable/equatable.dart';
import 'package:hemend/debug/error_handler.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecase.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../repositories/form_manager_interface.dart';

class DeleteFormUsecase with EquatableMixin implements IUsecase<void, FormEntity> {
  @override
  List<Object?> get props => [_repository];
  final FormManagerInterface _repository;
  const DeleteFormUsecase(this._repository);
  @override
  Future<DataSnapHandler<void>> execute([FormEntity? params]) async {
    try {
      if (params == null) {
        throw ErrorHandler('params cannot be null', {
          ErrorType.typeError,
        });
      }
      await _repository.deleteForm(params);
      return const DataSnapHandler<bool>.done(
        data: true,
        sender: DeleteFormUsecase,
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

  @override
  String get modelName => 'delete usecase';
}
