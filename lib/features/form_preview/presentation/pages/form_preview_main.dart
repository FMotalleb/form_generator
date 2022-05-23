import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../static_tools.dart';
import '../bloc/form_preview_bloc.dart';

class FormPreviewPage extends StatelessWidget {
  /// {@macro counter_page}
  const FormPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormPreviewBloc(GetIt.I.get()),
      child: const FormPreviewPageView(),
    );
  }
}

class FormPreviewPageView extends StatelessWidget {
  const FormPreviewPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<FormPreviewBloc, FormPreviewState>(
          builder: (context, state) {
            return const SizedBox();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'add_form_button',
            tooltip: appLocalization.addForm,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: const Icon(Icons.add),
            onPressed: () {
              // context.read<AddFormBloc>().add(const AddNewFormEvent());
            },
          ),
          FloatingActionButton(
            heroTag: 'change theme',
            tooltip: appLocalization.changeTheme,
            child: const Icon(Icons.brightness_6),
            onPressed: () {
              // context.read<ThemeCubit>().toggleTheme();
            },
          ),
          FloatingActionButton(
            heroTag: 'change language',
            tooltip: appLocalization.changeLanguage,
            child: const Icon(Icons.language_outlined),
            onPressed: () {
              // context.read<ThemeCubit>().switchLocale();
            },
          ),
          FloatingActionButton(
            heroTag: 'sync',
            tooltip: appLocalization.syncWithDb,
            child: const Icon(Icons.sync),
            onPressed: () {
              // context.read<AddFormBloc>().add(const SyncFormsWithDataBaseEvent());
            },
          ),
          FloatingActionButton(
            heroTag: 'load db',
            tooltip: appLocalization.loadDb,
            child: const Icon(Icons.open_in_browser),
            onPressed: () {
              // context.read<AddFormBloc>().add(const LoadDataFromDataBaseEvent());
            },
          ),
          FloatingActionButton(
            heroTag: 'goto preview',
            tooltip: appLocalization.loadDb,
            child: const Icon(Icons.preview),
            onPressed: () {
              // context.read<AddFormBloc>().add(const GotoPreviewFormEvent());
            },
          ),
          FloatingActionButton(
            heroTag: 'delete_icon',
            tooltip: appLocalization.clear,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: const Icon(Icons.delete),
            onPressed: () {
              // context.read<AddFormBloc>().add(const DeleteDataBaseEvent());
            },
          ),
        ],
      ),
    );
  }
}
