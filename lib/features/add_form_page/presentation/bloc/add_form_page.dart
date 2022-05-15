import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/contracts/typedefs/form_enums/field_types.dart';

import '../../../../core/models_and_entities/database_models/isar/isar_form_models/form_model.dart';
import '../../../../core/models_and_entities/models/form_models/field_model.dart';
import '../../../../core/models_and_entities/models/form_models/form_model.dart';
import '../../../../core/services/io/database/isar/isar_db_data_source.dart';

part 'add_form_page_event.dart';
part 'add_form_page_state.dart';

/// {@template counter_bloc}
/// A simple [Bloc] that manages an `int` as its state.
/// {@endtemplate}
class AddFormBloc extends Bloc<AddFormEvent, int> {
  /// {@macro counter_bloc}
  AddFormBloc() : super(0) {
    on<AddFormIncrementPressed>((event, emit) async {
      emit(state + 1);
    });
    on<AddFormDecrementPressed>((event, emit) async {
      emit(state - 1);
    });
  }
}
