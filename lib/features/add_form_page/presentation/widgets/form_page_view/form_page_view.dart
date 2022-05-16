import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hemend/ui_related/pre_built_widgets/tap_interactive.dart';

import '../../../../../core/contracts/typedefs/form_enums/field_types.dart';
import '../../../../../core/custom_widgets/slide_transiton.dart';
import '../../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../../../../../core/models_and_entities/entities/form_entities/field_entity.dart' as field_entity;
import '../../../domain/repositories/form_manager_interface.dart';

class FormPageView extends StatefulWidget {
  const FormPageView({Key? key, required this.boundForm}) : super(key: key);
  final FormEntity boundForm;

  @override
  State<FormPageView> createState() => _FormPageViewState();
}

class _FormPageViewState extends State<FormPageView> {
  late final _titleController = TextEditingController(
    text: widget.boundForm.title,
  );
  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      widget.boundForm.title = _titleController.text;
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
    return SizedBox(
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
              ...widget.boundForm.fields.map(
                (e) => ScaledSlideAnimation(
                  beginOffset: const Offset(0.5, 0),
                  endOffset: Offset.zero,
                  child: GestureDetector(
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
                                  widget.boundForm.fields.remove(e);
                                });
                                GetIt.I.get<FormManagerInterface>().updateForm(
                                      widget.boundForm,
                                    );
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
                    child: Text(
                      e.label,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.boundForm.fields = {
                      ...widget.boundForm.fields,
                      field_entity.FormFieldEntity(
                        id: int.parse(
                          '${widget.boundForm.id}${Random.secure().nextInt(9999999)}',
                        ),
                        label: 'New Field ${Random().nextInt(1000)}',
                        type: FieldType.select,
                        error: '',
                        hint: '',
                        isValid: 'number',
                        key: 'randomNess',
                      ),
                    };
                  });
                  GetIt.I.get<FormManagerInterface>().updateForm(
                        widget.boundForm,
                      );
                },
                child: Text('Add Field'),
              ),
            ],
          ),
        ),
        // borderOnForeground: true,
      ),
    );
  }
}
