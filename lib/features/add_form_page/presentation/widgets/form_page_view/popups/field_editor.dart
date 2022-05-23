import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/contracts/enums/form_enums/field_types.dart';
import '../../../../../../core/models_and_entities/entities/form_entities/field_entity.dart';
import '../../../../../../core/services/state/theme_handler.dart';
import '../../../../../../static_tools.dart';

class FieldEditorPopup extends StatefulWidget {
  FieldEditorPopup({
    Key? key,
    required this.field,
    required this.theme,
  }) : super(key: key);
  final FormFieldEntity field;
  final ThemeData theme;
  @override
  State<FieldEditorPopup> createState() => _FieldEditorPopupState();
}

enum EditableFields {
  label,
  hint,
  required,
  type;

  const EditableFields();

  String get getLabel {
    late String result;
    switch (this) {
      case EditableFields.label:
        result = appLocalization.fieldsLabel;
        break;
      case EditableFields.hint:
        result = appLocalization.fieldsHint;
        break;
      case EditableFields.required:
        result = appLocalization.fieldsRequired;
        break;
      case EditableFields.type:
        result = appLocalization.fieldsType;
        break;
    }
    return result;
  }
}

class _FieldEditorPopupState extends State<FieldEditorPopup> {
  late final _field = widget.field;
  Map<EditableFields, TextEditingController> get _controllers => _textControllers;
  late final Map<EditableFields, TextEditingController> _textControllers = {
    EditableFields.label: _field.label.textEditingController
      ..addListener(() {
        _field.label = _controllers[EditableFields.label]!.text;
      }),
    // 'error': _field.error.textEditingController
    //   ..addListener(() {
    //     _field.error = _controllers['error']!.text;
    //   }),
    EditableFields.hint: _field.hint.textEditingController
      ..addListener(() {
        _field.hint = _controllers[EditableFields.hint]!.text;
      }),
  };
  @override
  void dispose() {
    for (final controller in _textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        child: generateView(context),
      ),
    );
  }

  Widget generateView(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: 400,
        height: 600,
        child: Card(
          color: widget.theme.cardTheme.color,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ..._textControllers.entries.map(
                  (e) => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: widget.theme.hoverColor.withOpacity(0.1),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${e.key.getLabel}: ',
                          style: widget.theme.primaryTextTheme.displaySmall?.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            controller: e.value,
                            style: widget.theme.primaryTextTheme.displaySmall?.copyWith(
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CupertinoSlidingSegmentedControl<FieldType>(
                  groupValue: _field.type,
                  onValueChanged: (value) {
                    setState(() {
                      _field.type = value!;
                    });
                  },
                  children: Map.fromEntries(
                    FieldType.values.map(
                      (e) => MapEntry(
                        e,
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            e.icon,
                            size: 29,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text(
                        appLocalization.cancel,
                        style: widget.theme.elevatedButtonTheme.style?.textStyle?.resolve({}),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(widget.field);
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButtonTheme.of(context).style?.copyWith(
                            backgroundColor: materialStatePropForElevatedBtn(
                              byDefault: const Color.fromARGB(255, 230, 125, 118),
                              onHovered: const Color.fromARGB(255, 255, 17, 0),
                              onPressed: const Color.fromARGB(255, 126, 16, 8),
                            ),
                            overlayColor: materialStatePropForElevatedBtn(
                              byDefault: const Color.fromARGB(73, 255, 17, 0),
                              onHovered: const Color.fromARGB(73, 255, 17, 0),
                              onPressed: const Color.fromARGB(73, 255, 17, 0),
                            ),
                          ),
                      child: Text(
                        appLocalization.delete,
                        style: widget.theme.elevatedButtonTheme.style?.textStyle?.resolve({}),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(null);
                      },
                    ),
                    ElevatedButton(
                      child: Text(
                        appLocalization.save,
                        style: widget.theme.elevatedButtonTheme.style?.textStyle?.resolve({}),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(_field);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension TextEditor on String {
  TextEditingController get textEditingController => TextEditingController(text: this);
}
