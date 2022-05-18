part of 'add_form_page.dart';

/// Event being processed by [AddFormBloc].
abstract class AddFormEvent extends Equatable {
  const AddFormEvent();
}

class LoadDataFromDataBaseEvent extends AddFormEvent {
  final bool forcedRefresh;
  const LoadDataFromDataBaseEvent({
    this.forcedRefresh = true,
  });
  @override
  List<Object?> get props => [];
}

class AddNewFormEvent extends AddFormEvent {
  const AddNewFormEvent();
  @override
  List<Object> get props => [];
}

class DeleteDataBaseEvent extends AddFormEvent {
  const DeleteDataBaseEvent();
  @override
  List<Object?> get props => [];
}

class EditFormEvent extends AddFormEvent {
  final FormEntity form;
  const EditFormEvent(this.form);
  @override
  List<Object?> get props => [form];
}

class SyncFormsWithDataBaseEvent extends AddFormEvent {
  const SyncFormsWithDataBaseEvent();
  @override
  List<Object?> get props => [];
}

class RemoveSpecifiedFormEvent extends AddFormEvent {
  final FormEntity form;
  final bool forced;
  const RemoveSpecifiedFormEvent(this.form, {this.forced = false});
  @override
  List<Object> get props => [form];
}
