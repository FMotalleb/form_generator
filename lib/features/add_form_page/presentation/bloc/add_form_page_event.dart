part of 'add_form_page.dart';

/// Event being processed by [AddFormBloc].
abstract class AddFormEvent extends Equatable {
  const AddFormEvent();
}

/// Notifies bloc to increment state.
class AddNewFormEvent extends AddFormEvent {
  const AddNewFormEvent();
  @override
  List<Object> get props => [];
}

/// Notifies bloc to decrement state.
class RemoveLastFormEvent extends AddFormEvent {
  const RemoveLastFormEvent();
  @override
  List<Object> get props => [];
}

class LoadDataFromDataBaseEvent extends AddFormEvent {
  const LoadDataFromDataBaseEvent();
  @override
  List<Object?> get props => [];
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
  const RemoveSpecifiedFormEvent(this.form);
  @override
  List<Object> get props => [form];
}
