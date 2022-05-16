import 'package:equatable/equatable.dart';
import 'package:hemend/debug/error_handler.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecases.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../repositories/form_manager_interface.dart';

class DeleteFormUsecases with EquatableMixin implements BaseUsecases<void, FormEntity> {
  @override
  List<Object?> get props => [_repository];
  final FormManagerInterface _repository;
  const DeleteFormUsecases(this._repository);
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
        sender: DeleteFormUsecases,
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
