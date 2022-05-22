import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/repositories/form_manager_interface.dart';
import '../../domain/usecases/get_all_forms_usecase.dart';

part 'form_preview_event.dart';
part 'form_preview_state.dart';

class FormPreviewBloc extends Bloc<FormPreviewEvent, FormPreviewState> {
  final IFormManager _formManager;
  GetAllItemsUsecase get _getAllItemsUsecase => GetAllItemsUsecase(_formManager);
  FormPreviewBloc(this._formManager) : super(FormPreviewInitial()) {
    on<FormPreviewEvent>((event, emit) {});
  }
}
