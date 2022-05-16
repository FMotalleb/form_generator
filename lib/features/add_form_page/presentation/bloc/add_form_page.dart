import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../../data/repositories/form_manager_repo.dart';
import '../../domain/repositories/form_manager_interface.dart';

part 'add_form_page_event.dart';
part 'add_form_page_state.dart';

/// {@template counter_bloc}
/// A simple [Bloc] that manages an `int` as its state.
/// {@endtemplate}
class AddFormBloc extends Bloc<AddFormEvent, AddFormPageState> {
  Set<FormEntity> forms;
  final FormManagerInterface _formManager;

  /// {@macro counter_bloc}
  AddFormBloc(this._formManager)
      : forms = {},
        super(AddFormPageStateInitial()) {
    on<AddFormIncrementPressed>((event, emit) async {
      final newForm = FormEntity(
        id: Random.secure().nextInt(99999999),
        index: forms.length,
        title: 'test form ${forms.length + 1}',
      );
      forms = {
        ...forms,
        newForm,
      };
      await _formManager.addForm(newForm);

      print(newForm);
      emit(AddFormPageStateValue(forms: forms.toList()));
    });
    on<AddFormDecrementPressed>((event, emit) async {
      if (forms.isNotEmpty) {
        final lastItem = forms.last.id;
        forms = forms.where((element) => element.id != lastItem).toSet();
        await _formManager.deleteForm(lastItem);

        emit(AddFormPageStateValue(forms: forms.toList()));
      }
    });
    on<AddFormReloadLastData>(
      (event, emit) async {
        final value = await _formManager.getAllForms();
        forms = value.toSet();

        emit(AddFormPageStateValue(forms: value));
      },
    );
    on<AddFormDeleteDataBase>(
      (event, emit) async {
        await _formManager.deleteAll();
        forms.clear();

        emit(AddFormPageStateValue(forms: forms.toList()));
      },
    );
  }
}
