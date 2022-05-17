import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/custom_widgets/slide_transition.dart';
import '../../../../core/services/state/theme_handler.dart';
import '../bloc/add_form_page.dart';
import '../widgets/form_page_view/form_page_view.dart';

class AddFormPage extends StatelessWidget {
  /// {@macro counter_page}
  const AddFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddFormBloc(GetIt.I.get()),
      child: const AddFormView(),
    );
  }
}

/// {@template counter_view}
/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [AddFormBloc].
/// {@endtemplate}
class AddFormView extends StatelessWidget {
  /// {@macro counter_view}
  const AddFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('AddForm')),
      body: Center(
        child: BlocBuilder<AddFormBloc, AddFormPageState>(
          builder: (context, state) {
            if (state is AddFormPageStateValue && state.forms.isNotEmpty) {
              return SingleChildScrollView(
                child: Wrap(
                  // key: ValueKey(state.forms.hashCode),
                  children: state.forms.map(
                    (e) {
                      return ScaledSlideAnimation(
                        key: ValueKey(e.id),
                        beginOffset: const Offset(0, 0.5),
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
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<AddFormBloc>().add(const AddNewFormEvent());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<AddFormBloc>().add(const RemoveLastFormEvent());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.sync),
            onPressed: () {
              context.read<AddFormBloc>().add(const SyncFormsWithDataBaseEvent());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.open_in_browser),
            onPressed: () {
              context.read<AddFormBloc>().add(const LoadDataFromDataBaseEvent());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
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
