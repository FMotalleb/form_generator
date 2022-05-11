import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'starting_page_event.dart';
part 'starting_page_state.dart';

class StartingPageBloc extends Bloc<StartingPageEvent, StartingPageState> {
  StartingPageBloc() : super(StartingPageInitial()) {
    on<StartingPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
