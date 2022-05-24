import 'package:equatable/equatable.dart';
import 'package:hemend/debug/error_handler.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../../../core/contracts/interfaces/base_usecases/base_usecase.dart';
import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../repositories/form_manager_interface.dart';

class GetAllItemsUsecase with EquatableMixin implements IUsecase<void, void> {
  final IFormManager _repository;
  const GetAllItemsUsecase(
    this._repository,
  );
  @override
  Future<DataSnapHandler<List<FormEntity>>> invoke([void params]) async {
    final result = await _repository.getAllForms();
    if (result == null) {
      return DataSnapHandler.error(
        exception: ErrorHandler('No Data Found', {
          ErrorType.notFound,
        }),
        sender: StackTrace.current,
      );
    }
    for (final item in result) {
      final tempList = item.fields.toList();
      tempList.sort((a, b) {
        return a.index.compareTo(b.index);
      });
      item.fields = tempList.toSet();
    }
    try {
      return DataSnapHandler.done(
        data: result,
        sender: GetAllItemsUsecase,
      );
    } catch (e, st) {
      return DataSnapHandler.error(
        exception: e,
        sender: st,
      );
    }
  }

  @override
  List<Object?> get props => [_repository];

  @override
  String get moduleName => 'get all items usecase';
}
