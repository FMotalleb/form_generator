part of 'add_form_page.dart';

/// Event being processed by [AddFormBloc].
abstract class AddFormEvent extends Equatable {}

/// Notifies bloc to increment state.
class AddFormIncrementPressed extends AddFormEvent {
  @override
  List<Object> get props => [];
}

/// Notifies bloc to decrement state.
class AddFormDecrementPressed extends AddFormEvent {
  @override
  List<Object> get props => [];
}

class AddFormReloadLastData extends AddFormEvent {
  @override
  List<Object?> get props => [];
}

class AddFormDeleteDataBase extends AddFormEvent {
  @override
  List<Object?> get props => [];
}
