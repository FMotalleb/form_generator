import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/contracts/enums/form_enums/field_types.dart';
import '../../../../../core/custom_widgets/slide_transition.dart';
import '../../../../../core/models_and_entities/entities/form_entities/field_entity.dart' as field_entity;
import '../../../../../core/models_and_entities/entities/form_entities/field_entity.dart';
import '../../../../../core/models_and_entities/entities/form_entities/form_entity.dart';

import '../../../../../static_tools.dart';
import 'popups/field_editor.dart';

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
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView(
                  children: [
                    TextField(
                      enabled: !widget.displayOnly,
                      controller: _titleController,
                      style: theme.primaryTextTheme.displaySmall,
                      decoration: InputDecoration(
                        border: theme.inputDecorationTheme.border,
                      ),
                    ),
                    ..._boundForm.fields.map(
                      (e) => createFieldView(theme, context, e),
                    ),
                    if (!widget.displayOnly)
                      ElevatedButton(
                        onPressed: () {
                          setState(addField);
                          _callNullableFunction(widget.onFormChanged, _boundForm);
                        },
                        style: theme.elevatedButtonTheme.style,
                        child: Text(
                          appLocalization.addField,
                          style: theme.elevatedButtonTheme.style?.textStyle?.resolve({}),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // borderOnForeground: true,
          ),
        ),
        if (!widget.displayOnly) generateCloseBtn()
      ],
    );
  }

  Positioned generateCloseBtn() {
    return Positioned(
      child: InkWell(
        hoverColor: const Color.fromARGB(255, 255, 17, 0),
        splashColor: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        onTap: () {
          _callNullableFunction(widget.onFormRemoved, _boundForm);
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(193, 255, 24, 8),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: const Icon(
            Icons.close,
            size: 25,
          ),
        ),
      ),
    );
  }

  void addField() {
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
        internalValidators: '',
        key: StringToolkit.getRandomString(15),
      ),
    };
  }

  Widget createFieldView(
    ThemeData theme,
    BuildContext context,
    field_entity.FormFieldEntity e,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: FadedSlideAnimation(
        child: ListTile(
          key: ValueKey(e),
          shape: theme.listTileTheme.shape,
          onTap: () async {
            if (widget.displayOnly) return;
            final resultField = await showDialog<FormFieldEntity>(
              context: context,
              builder: (context) => FieldEditorPopup(
                field: e,
                theme: theme,
              ),
            );
            if (resultField == null) {
              _boundForm.fields = _boundForm.fields.where((element) => element.id != e.id).toSet();
            }
            _callNullableFunction(widget.onFormChanged, _boundForm);
            setState(() {});
          },
          leading: Icon(
            e.type.icon,
          ),
          title: Text(
            e.label,
          ),
          subtitle: e.hint.isNotEmpty
              ? Text(
                  e.hint,
                )
              : null,
        ),
      ),
    );
  }
}

abstract class StringToolkit {
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final _rnd = Random.secure();

  static String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
