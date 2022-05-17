import 'package:equatable/equatable.dart';
import '../../../../core/contracts/interfaces/base_usecases/base_usecases.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../repositories/form_manager_interface.dart';

class GetAllItemsUsecases with EquatableMixin implements BaseUsecases<void, void> {
  final FormManagerInterface _repository;
  const GetAllItemsUsecases(
    this._repository,
  );
  @override
  Future<List<FormEntity>> execute([void params]) async {
    final result = await _repository.getAllForms();
    for (final item in result) {
      final tempList = item.fields.toList();
      tempList.sort((a, b) {
        return a.index.compareTo(b.index);
      });
      item.fields = tempList.toSet();
    }
    try {
      return result;
    } catch (e, st) {
      rethrow;
    }
  }

  @override
  FormManagerInterface get repository => _repository;
  @override
  List<Object?> get props => [_repository];
}
