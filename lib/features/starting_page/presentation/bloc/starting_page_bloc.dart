import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../core/contracts/typedefs/form_enums/field_types.dart';
import '../../../../core/data_models/database_models/isar/isar_form_models/form_model.dart';
import '../../../../core/data_models/models/form_models/field_model.dart';
import '../../../../core/data_models/models/form_models/form_model.dart';

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
      final isarInstance = GetIt.I.get<Isar>();
      final testForm = FormModel(
        title: 'sample',
        description: 'sample form',
        fields: {FormField(key: 'test', type: FieldType.string, label: 'test')},
      ).asIsarModel;

      await isarInstance.writeTxn(
        (isar) async {
          testForm.id = await isar.isarFormModels.put(
            testForm,
          );
        },
      ).then((value) => print('testForm.id: $value'));
      testForm.isarFields.add(FormField(key: 'test2', type: FieldType.string, label: 'test').asIsarModel);
      await isarInstance.writeTxn(
        (isar) async {
          await testForm.isarFields.save();
        },
      ).then((value) => print('testForm.id: $value'));
    });
    on<CounterDecrementPressed>((event, emit) async {
      emit(state - 1);
      final isarInstance = GetIt.I.get<Isar>();

      isarInstance
          .txn(
        (isar) => isar.isarFormModels.buildQuery().findAll(),
      )
          .then(
        (e) {
          var isarFormModels = e.map((e) => e as IsarFormModel).toList();
          isarFormModels.first.isarFields.loadSync();
          print(e);
        },
      );
      // isarInstance
      //     .writeTxn(
      //       (isar) => isar.isarFormModels.buildQuery().deleteAll(),
      //     )
      //     .then(
      //       (e) => print(
      //         'e: $e',
      //       ),
      //     );
    });
  }
}
