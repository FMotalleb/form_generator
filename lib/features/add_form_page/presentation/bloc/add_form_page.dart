import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:hemend/debug/logger.dart';

import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../../../../get_it_registrant.dart';
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
  List<FormEntity> get sortedForms {
    final list = forms.toList();
    list.sort((a, b) => a.index.compareTo(b.index));
    return list;
  }

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
      final index = forms.isEmpty ? 0 : sortedForms.last.index + 1;
      final newForm = FormEntity(
        id: Random().nextInt(999999999),
        index: index,
        title: 'test form $index',
      );
      forms = {
        ...forms,
        newForm,
      };
      print(newForm);
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

      emit(AddFormPageStateValue(forms: sortedForms));
    });
    on<RemoveSpecifiedFormEvent>((event, emit) async {
      final item = event.form;
      forms = forms.where((element) => element.id != item.id).toSet();
      _deleteFormUsecases.execute(item).then(
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
      emit(AddFormPageStateValue(forms: sortedForms));
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
        emit(AddFormPageStateValue(forms: sortedForms));
      }
    });
    on<LoadDataFromDataBaseEvent>(
      (event, emit) async {
        forms = {};
        emit(AddFormPageStateValue(forms: sortedForms));
        final value = await _getAllFormsUsecases.execute();
        value.singleActOnFinished(
          onDone: (d) {
            forms = d!.toSet();
            emit(AddFormPageStateValue(forms: sortedForms));
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

        emit(AddFormPageStateValue(forms: sortedForms));
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

    add(const LoadDataFromDataBaseEvent());
  }
}

SnackBar infoSnackbar(String info) {
  final theme = Theme.of(GetIt.I.get());
  return SnackBar(
    content: Text(
      info,
      style: theme.snackBarTheme.contentTextStyle,
    ),
    backgroundColor: theme.snackBarTheme.backgroundColor,
    elevation: 0,
    shape: theme.snackBarTheme.shape,
    behavior: SnackBarBehavior.fixed,
    // margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
  );
}

extension ShowSnack on SnackBar {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show() => noContextSnackBar(this);
}
