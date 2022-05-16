import 'package:equatable/equatable.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecases.dart';
import '../repositories/form_manager_interface.dart';

class DeleteAllUsecases with EquatableMixin implements BaseUsecases<void, void> {
  @override
  List<Object?> get props => [_repository];
  final FormManagerInterface _repository;
  const DeleteAllUsecases(this._repository);
  @override
  Future<DataSnapHandler<void>> execute([void none]) async {
    try {
      return DataSnapHandler.done(
        data: await _repository.deleteAll(),
        sender: DeleteAllUsecases,
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
