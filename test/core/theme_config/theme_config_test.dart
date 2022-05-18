import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/services/state/theme_handler.dart';

void main() {
  group(
    'Testing theme config',
    () {
      late ThemeCubit theme;
      setUp(() {
        theme = ThemeCubit();
      });
      testWidgets(
        'testing change',
        (WidgetTester tester) async {
          expect(theme.getCurrentTheme.brightness, Brightness.dark);
          theme.toggleTheme();
          expect(theme.getCurrentTheme.brightness, Brightness.light);
          theme.toggleTheme();
          expect(theme.getCurrentTheme.brightness, Brightness.dark);
        },
      );
    },
  );
}
