import 'package:equatable/equatable.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecase.dart';
import '../repositories/form_manager_interface.dart';

class DeleteAllFormsUsecases with EquatableMixin implements IUsecase<void, void> {
  @override
  List<Object?> get props => [_repository];
  final IFormManager _repository;
  const DeleteAllFormsUsecases(this._repository);
  @override
  Future<DataSnapHandler<void>> invoke([void none]) async {
    try {
      await _repository.deleteAllForms();
      return const DataSnapHandler<bool>.done(
        data: true,
        sender: DeleteAllFormsUsecases,
      );
    } catch (e, st) {
      return DataSnapHandler.error(
        exception: e,
        sender: st,
      );
    }
  }

  @override
  String get moduleName => 'delete all forms usecase';
}
