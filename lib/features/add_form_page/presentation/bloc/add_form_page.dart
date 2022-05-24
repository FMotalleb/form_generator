import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hemend/debug/logger.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../../../../core/services/navigator/navigator.dart';
import '../../../../core/services/state/theme_handler.dart';
import '../../../../static_tools.dart';
import '../../domain/repositories/form_manager_interface.dart';
import '../../domain/usecases/add_new_form_usecase.dart';
import '../../domain/usecases/delete_all_forms_usecase.dart';
import '../../domain/usecases/delete_form_usecase.dart';
import '../../domain/usecases/edit_form_usecase.dart';
import '../../domain/usecases/get_all_forms_usecase.dart';
import '../widgets/form_page_view/popups/remove_form_dialog.dart';

part 'add_form_page_event.dart';
part 'add_form_page_state.dart';

/// {@template counter_bloc}
/// A simple [Bloc] that manages an `int` as its state.
/// {@endtemplate}
class AddFormBloc extends Bloc<AddFormEvent, AddFormPageState> {
  Set<FormEntity> forms;
  void addForm(FormEntity form) {
    forms = {...sortedForms.where((element) => element.id != form.id), form};
  }

  List<FormEntity> get sortedForms {
    final list = forms.toList();
    list.sort((a, b) => a.index.compareTo(b.index));
    return list;
  }

  final IFormManager formManager;
  AddNewFormUseCase get _addNewFormUsecases => AddNewFormUseCase(
        formManager,
      );
  DeleteAllFormsUsecases get _deleteAllUsecases => DeleteAllFormsUsecases(
        formManager,
      );
  EditFormUseCase get _editFormUsecases => EditFormUseCase(
        formManager,
      );
  GetAllItemsUsecase get _getAllFormsUsecases => GetAllItemsUsecase(
        formManager,
      );
  DeleteFormUsecase get _deleteFormUsecases => DeleteFormUsecase(
        formManager,
      );
  AddFormPageState getStateForForms() {
    if (forms.isEmpty) {
      return const AddFormPageStateInitial();
    } else {
      return AddFormPageStateValue(forms: sortedForms);
    }
  }

  /// {@macro counter_bloc}
  AddFormBloc({required this.formManager, bool initialLoad = true})
      : forms = {},
        super(const AddFormPageStateInitial()) {
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
      _addNewFormUsecases.invoke(newForm).then(
            (value) => value.singleActOnFinished(
              onDone: (d) {
                'add new form finished'.log();
              },
              onError: (e) {
                'add new form error'.log();
              },
            ),
          );

      emit(getStateForForms());
    });
    on<RemoveSpecifiedFormEvent>((event, emit) async {
      final item = event.form;
      var permission = event.forced;
      if (!permission) {
        permission = await noContextDialog(
              builder: (p1) => RemoveFormView(
                form: item,
                theme: GetIt.I.get<ThemeCubit>().getCurrentTheme,
              ),
            ) ??
            false;
      }

      if (permission == true) {
        forms = forms.where((element) => element.id != item.id).toSet();
        _deleteFormUsecases.invoke(item).then(
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
        emit(getStateForForms());
      }
    });

    on<LoadDataFromDataBaseEvent>(
      (event, emit) async {
        forms = {};
        if (event.forcedRefresh) {
          emit(getStateForForms());
        }
        final value = await _getAllFormsUsecases.invoke();

        value.singleActOnFinished(
          onDone: (d) {
            forms = d!.toSet();
            emit(getStateForForms());
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
        await _deleteAllUsecases.invoke();
        forms.clear();

        emit(getStateForForms());
      },
    );

    on<EditFormEvent>(
      (event, emit) async {
        final result = await _editFormUsecases.invoke(event.form);
        try {
          addForm(event.form);

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
        } catch (e, st) {
          'error editing form'.log(
            error: e,
            stackTrace: st,
          );
        }
        emit(getStateForForms());
      },
    );
    on<SyncFormsWithDataBaseEvent>(
      (event, emit) async {
        await _deleteAllUsecases.invoke();
        for (final i in forms) {
          await _addNewFormUsecases.invoke(i);
        }
      },
    );
    on<GotoPreviewFormEvent>(
      (event, emit) {
        AppRouteNavigator.push(AppRoutes.formPreview);
      },
    );
    if (initialLoad) {
      add(const LoadDataFromDataBaseEvent(forcedRefresh: false));
    }
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
  );
}

extension ShowSnack on SnackBar {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show() => noContextSnackbar(this);
}
