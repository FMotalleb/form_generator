import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/custom_widgets/slide_transition.dart';
import '../../../../core/services/state/theme_handler.dart';
import '../../../../get_it_registrant.dart';
import '../bloc/add_form_page.dart';
import '../widgets/form_page_view/form_page_view.dart';

class AddFormPage extends StatelessWidget {
  /// {@macro counter_page}
  const AddFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddFormBloc(formManager: GetIt.I.get()),
      child: const AddFormView(),
    );
  }
}

class AddFormView extends StatelessWidget {
  const AddFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AddFormBloc, AddFormPageState>(
          builder: (context, state) {
            if (state is AddFormPageStateValue && state.forms.isNotEmpty) {
              return SingleChildScrollView(
                child: Wrap(
                  children: state.forms.map(
                    (e) {
                      return FadedSlideAnimation(
                        key: ValueKey(
                          e.id,
                        ),
                        child: FormPageView(
                          boundForm: e,
                          onFormRemoved: (form) => context.read<AddFormBloc>().add(
                                RemoveSpecifiedFormEvent(form),
                              ),
                          onFormChanged: (form) => context.read<AddFormBloc>().add(
                                EditFormEvent(form),
                              ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              );
            } else {
              return Text(
                'Just Loaded',
                style: Theme.of(context).textTheme.headline1,
              );
            }
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            tooltip: appLocalization.addForm,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<AddFormBloc>().add(const AddNewFormEvent());
            },
          ),
          FloatingActionButton(
            tooltip: appLocalization.changeTheme,
            child: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
          FloatingActionButton(
            tooltip: appLocalization.changeLanguage,
            child: const Icon(Icons.language_outlined),
            onPressed: () {
              context.read<ThemeCubit>().switchLocale();
            },
          ),
          FloatingActionButton(
            tooltip: appLocalization.syncWithDb,
            child: const Icon(Icons.sync),
            onPressed: () {
              context.read<AddFormBloc>().add(const SyncFormsWithDataBaseEvent());
            },
          ),
          FloatingActionButton(
            tooltip: appLocalization.loadDb,
            child: const Icon(Icons.open_in_browser),
            onPressed: () {
              context.read<AddFormBloc>().add(const LoadDataFromDataBaseEvent());
            },
          ),
          FloatingActionButton(
            tooltip: appLocalization.clear,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: const Icon(Icons.delete),
            onPressed: () {
              context.read<AddFormBloc>().add(const DeleteDataBaseEvent());
            },
          ),
        ],
      ),
    );
  }
}
