import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hemend/debug/logger.dart';

import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../../domain/repositories/form_manager_interface.dart';
import '../../domain/usecases/add_new_form_usecases.dart';
import '../../domain/usecases/delete_all_forms_usecases.dart';
import '../../domain/usecases/delete_form_usecases.dart';
import '../../domain/usecases/edit_form_usecases.dart';
import '../../domain/usecases/get_all_forms_usecases.dart';

part 'add_form_page_event.dart';
part 'add_form_page_state.dart';

/// {@template counter_bloc}
/// A simple [Bloc] that manages an `int` as its state.
/// {@endtemplate}
class AddFormBloc extends Bloc<AddFormEvent, AddFormPageState> {
  Set<FormEntity> forms;

  final FormManagerInterface _formManager;
  AddNewFormUseCases get _addNewFormUsecases => AddNewFormUseCases(
        _formManager,
      );
  DeleteAllUsecases get _deleteAllUsecases => DeleteAllUsecases(
        _formManager,
      );
  EditFormUseCases get _editFormUsecases => EditFormUseCases(
        _formManager,
      );
  GetAllItemsUsecases get _getAllFormsUsecases => GetAllItemsUsecases(
        _formManager,
      );
  DeleteFormUsecases get _deleteFormUsecases => DeleteFormUsecases(
        _formManager,
      );

  /// {@macro counter_bloc}
  AddFormBloc(this._formManager)
      : forms = {},
        super(AddFormPageStateInitial()) {
    on<AddNewFormEvent>((event, emit) async {
      final newForm = FormEntity(
        id: Random.secure().nextInt(99999999),
        index: forms.length,
        title: 'test form ${forms.length + 1}',
      );
      forms = {
        ...forms,
        newForm,
      };
      _addNewFormUsecases.execute(newForm).then(
            (value) => value.singleActOnFinished(
              onDone: (d) {
                'add new form finished'.log();
              },
              onError: (e) {
                'add new form error'.log();
              },
            ),
          );

      emit(AddFormPageStateValue(forms: forms.toList()));
    });
    on<RemoveLastFormEvent>((event, emit) async {
      if (forms.isNotEmpty) {
        final lastItem = forms.last;
        forms = forms.where((element) => element.id != lastItem.id).toSet();

        _deleteFormUsecases.execute(lastItem).then(
              (value) => value.singleActOnFinished(
                onDone: (d) {
                  'delete last finished'.log();
                },
                onError: (e) {
                  'delete last error'.log(
                    error: e,
                    stackTrace: (value.sender as StackTrace?) ?? StackTrace.current,
                  );
                },
              ),
            );
        emit(AddFormPageStateValue(forms: forms.toList()));
      }
    });
    on<LoadDataFromDataBaseEvent>(
      (event, emit) async {
        forms = {};
        emit(AddFormPageStateValue(forms: forms.toList()));
        final value = await _getAllFormsUsecases.execute();
        value.singleActOnFinished(
          onDone: (d) {
            forms = d!.toSet();

            emit(AddFormPageStateValue(forms: forms.toList()));
          },
          onError: (e) {
            'error loading all items'.log(
              error: e,
              stackTrace: (value.sender as StackTrace?) ?? StackTrace.current,
            );
          },
        );
      },
    );
    on<DeleteDataBaseEvent>(
      (event, emit) async {
        await _deleteAllUsecases.execute();
        forms.clear();

        emit(AddFormPageStateValue(forms: forms.toList()));
      },
    );
    on<EditFormEvent>(
      (event, emit) async {
        final result = await _editFormUsecases.execute(event.form);
        result.singleActOnFinished(
          onDone: (d) {
            'edit form finished'.log();
          },
          onError: (e) {
            'edit form has error'.log(
              error: e,
              stackTrace: (result.sender as StackTrace?) ?? StackTrace.current,
            );
          },
        );
      },
    );
    on<SyncFormsWithDataBaseEvent>(
      (event, emit) async {
        await _deleteAllUsecases.execute();
        for (final i in forms) {
          await _addNewFormUsecases.execute(i);
        }
      },
    );
  }
}
