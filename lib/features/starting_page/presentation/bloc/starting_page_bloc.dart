import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/contracts/typedefs/form_enums/field_types.dart';

import '../../../../core/models_and_entities/database_models/isar/isar_form_models/form_model.dart';
import '../../../../core/models_and_entities/models/form_models/field_model.dart';
import '../../../../core/models_and_entities/models/form_models/form_model.dart';
import '../../../../core/services/io/database/isar/isar_db_repository.dart';

part 'starting_page_event.dart';
part 'starting_page_state.dart';

/// {@template counter_bloc}
/// A simple [Bloc] that manages an `int` as its state.
/// {@endtemplate}
class CounterBloc extends Bloc<CounterEvent, int> {
  /// {@macro counter_bloc}
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) async {
      emit(state + 1);
    });
    on<CounterDecrementPressed>((event, emit) async {
      emit(state - 1);
    });
  }
}
