part of 'starting_page_bloc.dart';

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
