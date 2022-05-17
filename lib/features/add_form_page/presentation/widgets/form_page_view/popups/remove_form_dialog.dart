import 'package:flutter/material.dart';

import '../../../../../../core/models_and_entities/entities/form_entities/form_entity.dart';
import '../form_page_view.dart';

class RemoveFormView extends StatelessWidget {
  const RemoveFormView({
    Key? key,
    required this.form,
    required this.theme,
  }) : super(key: key);
  final FormEntity form;
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: generateView(context),
    );
  }

  Widget generateView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 35,
      ),
      // padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Are you sure you want to delete this form?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: FormPageView(
              boundForm: form,
              displayOnly: true,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  style: theme.elevatedButtonTheme.style,
                  child: Text(
                    'Cancel',
                    style: theme.elevatedButtonTheme.style?.textStyle?.resolve({}),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  style: theme.elevatedButtonTheme.style,
                  child: Text(
                    'Delete',
                    style: theme.elevatedButtonTheme.style?.textStyle?.resolve({}),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
