import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../generated/l10n.dart';

class ThemeCubit extends Cubit<ThemeAndLocaleData> {
  /// {@macro brightness_cubit}
  ThemeCubit()
      : super(
          ThemeAndLocaleData(
            theme: _darkTheme,
            locale: locales[0],
          ),
        );

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(),
      extendedPadding: EdgeInsets.zero,
    ),
    primaryTextTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Color.fromARGB(255, 27, 27, 27),
      ),
    ),
    cardTheme: const CardTheme(
      clipBehavior: Clip.antiAlias,
      color: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      surfaceTintColor: Colors.red,
      shadowColor: Color.fromARGB(255, 194, 194, 194),
      elevation: 15,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
    ),
    snackBarTheme: const SnackBarThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            color: Colors.white.withOpacity(0.87),
          ),
        ),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return const Color.fromARGB(55, 195, 248, 175);
          } else if (states.contains(MaterialState.hovered)) {
            return const Color.fromARGB(17, 128, 196, 101);
          } else {
            return null;
          }
        }),
        backgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return const Color.fromARGB(255, 0, 0, 0);
          } else if (states.contains(MaterialState.hovered)) {
            return const Color.fromARGB(255, 27, 27, 27);
          } else {
            return const Color.fromARGB(255, 48, 48, 48);
          }
        }),
        elevation: MaterialStateProperty.all(10),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
    brightness: Brightness.light,
  );
  static final _darkTheme = ThemeData(
    primaryTextTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      // foregroundColor: Color(0xFF000000),
      shape: RoundedRectangleBorder(),
      extendedPadding: EdgeInsets.zero,
    ),
    cardTheme: const CardTheme(
      clipBehavior: Clip.antiAlias,
      shadowColor: Color.fromARGB(255, 139, 139, 139),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      color: Color.fromARGB(240, 24, 24, 24),
      elevation: 10,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        overlayColor: materialStatePropForElevatedBtn(
          onPressed: const Color.fromARGB(48, 169, 255, 251),
          onHovered: const Color.fromARGB(6, 121, 243, 252),
          byDefault: null,
        ),
        backgroundColor: materialStatePropForElevatedBtn(
          onPressed: const Color.fromARGB(255, 255, 255, 255),
          onHovered: const Color.fromARGB(255, 224, 224, 224),
          byDefault: const Color.fromARGB(255, 189, 189, 189),
        ),
        elevation: materialStatePropForElevatedBtn(
          onPressed: 5,
          onHovered: 15,
          byDefault: 10,
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 139, 139, 139),
          width: 0.5,
        ),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
    brightness: Brightness.dark,
  );
  ThemeData get getCurrentTheme => state.theme.brightness == Brightness.dark ? _darkTheme : _lightTheme;
  // Locale _locale = locales[0];
  static final locales = S.delegate.supportedLocales;

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    final data = ThemeAndLocaleData(
      theme: state.theme.brightness == Brightness.dark ? _lightTheme : _darkTheme,
      locale: state.locale,
    );
    emit(data);
  }

  void switchLocale([String? locale]) {
    late Locale _locale;
    if (locale == null) {
      _locale = locales[(locales.indexOf(state.locale) + 1) % locales.length];
    } else {
      _locale = Locale(locale);
    }
    final data = ThemeAndLocaleData(
      theme: state.theme,
      locale: _locale,
    );
    emit(data);
  }
}

MaterialStateProperty<T> materialStatePropForElevatedBtn<T>({
  required T byDefault,
  required T onPressed,
  required T onHovered,
}) {
  return MaterialStateProperty.resolveWith<T>((states) {
    if (states.contains(MaterialState.pressed)) {
      return onPressed;
    } else if (states.contains(MaterialState.hovered)) {
      return onHovered;
    } else {
      return byDefault;
    }
  });
}

class ThemeAndLocaleData {
  final ThemeData theme;
  final Locale locale;
  ThemeAndLocaleData({
    required this.theme,
    required this.locale,
  });
}
