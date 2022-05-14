part of 'starting_page_bloc.dart';

/// Event being processed by [CounterBloc].
abstract class CounterEvent extends Equatable {}

/// Notifies bloc to increment state.
class CounterIncrementPressed extends CounterEvent {
  @override
  List<Object> get props => [];
}

/// Notifies bloc to decrement state.
class CounterDecrementPressed extends CounterEvent {
  @override
  List<Object> get props => [];
}
