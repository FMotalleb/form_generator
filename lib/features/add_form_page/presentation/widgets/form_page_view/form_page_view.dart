import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/contracts/typedefs/form_enums/field_types.dart';
import '../../../../../core/custom_widgets/slide_transition.dart';
import '../../../../../core/models_and_entities/entities/form_entities/field_entity.dart' as field_entity;
import '../../../../../core/models_and_entities/entities/form_entities/form_entity.dart';

class FormPageView extends StatefulWidget {
  const FormPageView({
    Key? key,
    required this.boundForm,
    this.onFormChanged,
    this.onFormRemoved,
    this.displayOnly = false,
  }) : super(key: key);
  final FormEntity boundForm;
  final void Function(FormEntity)? onFormChanged;
  final void Function(FormEntity)? onFormRemoved;
  final bool displayOnly;
  @override
  State<FormPageView> createState() => _FormPageViewState();
}

class _FormPageViewState extends State<FormPageView> {
  late final _boundForm = widget.boundForm;
  late final _titleController = TextEditingController(
    text: _boundForm.title,
  );
  void _callNullableFunction<T>(void Function(T)? function, T prams) {
    (function ?? (_) {})(prams);
  }

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      _boundForm.title = _titleController.text;
      _callNullableFunction(widget.onFormChanged, _boundForm);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        SizedBox(
          width: 360,
          height: 640,
          child: Card(
            clipBehavior: theme.cardTheme.clipBehavior,
            elevation: theme.cardTheme.elevation,
            margin: theme.cardTheme.margin,
            shape: theme.cardTheme.shape,
            shadowColor: theme.cardTheme.shadowColor,
            surfaceTintColor: theme.cardTheme.surfaceTintColor,
            color: theme.cardTheme.color,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  TextField(
                    controller: _titleController,
                    style: theme.primaryTextTheme.displaySmall,
                    decoration: InputDecoration(
                      border: theme.inputDecorationTheme.border,
                    ),
                  ),
                  ..._boundForm.fields.map(
                    (e) => createFieldView(theme, context, e),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        final index = _boundForm.fields.isEmpty
                            ? 0
                            : (_boundForm.fields.toList()..sort((a, b) => a.index.compareTo(b.index))).last.index + 1;
                        _boundForm.fields = {
                          ..._boundForm.fields,
                          field_entity.FormFieldEntity(
                            id: int.parse(
                              '${_boundForm.id}${Random.secure().nextInt(9999999)}',
                            ),
                            index: index,
                            label: 'New Field $index',
                            type: FieldType.NULL,
                            error: '',
                            hint: '',
                            isValid: '',
                            key: '',
                          ),
                        };
                      });
                      _callNullableFunction(widget.onFormChanged, _boundForm);
                    },
                    style: theme.elevatedButtonTheme.style,
                    child: Text(
                      'Add Field',
                      style: theme.elevatedButtonTheme.style?.textStyle?.resolve({}),
                    ),
                  ),
                ],
              ),
            ),
            // borderOnForeground: true,
          ),
        ),
        Positioned(
          child: GestureDetector(
            onTap: () {
              _callNullableFunction(widget.onFormRemoved, _boundForm);
            },
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Color.fromARGB(146, 253, 12, 12),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Icon(
                Icons.close,
                size: 25,
              ),
            ),
          ),
        )
      ],
    );
  }

  ScaledSlideAnimation createFieldView(
    ThemeData theme,
    BuildContext context,
    field_entity.FormFieldEntity e,
  ) {
    return ScaledSlideAnimation(
      child: ListTile(
        shape: theme.listTileTheme.shape,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Remove this field?'),
              content: const Text(
                'Are you sure you want to remove this field?',
              ),
              actions: [
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    setState(() {
                      _boundForm.fields.remove(e);
                    });
                    _callNullableFunction(widget.onFormChanged, _boundForm);
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        },
        leading: Icon(
          e.type.icon,
        ),
        title: Text(
          e.label,
        ),
      ),
    );
  }
}
