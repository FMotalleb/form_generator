import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/state/theme_handler.dart';
import '../bloc/add_form_page.dart';

class AddFormPage extends StatelessWidget {
  /// {@macro counter_page}
  const AddFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddFormBloc(),
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
      appBar: AppBar(title: const Text('AddForm')),
      body: Center(
        child: BlocBuilder<AddFormBloc, int>(
          builder: (context, count) {
            return Text('$count', style: Theme.of(context).textTheme.headline1);
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
              context.read<AddFormBloc>().add(AddFormIncrementPressed());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<AddFormBloc>().add(AddFormDecrementPressed());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
