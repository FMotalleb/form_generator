import 'package:equatable/equatable.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecases.dart';
import '../repositories/form_manager_interface.dart';

class DeleteAllUsecases with EquatableMixin implements BaseUsecases<void, void> {
  @override
  List<Object?> get props => [_repository];
  final FormManagerInterface _repository;
  const DeleteAllUsecases(this._repository);
  @override
  Future<void> execute([void none]) async {
    try {
      await _repository.deleteAll();
      return;
    } catch (e, st) {
      rethrow;
    }
  }

  @override
  FormManagerInterface get repository => _repository;
}
