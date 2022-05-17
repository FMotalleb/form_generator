import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/add_form_page/presentation/bloc/add_form_page.dart';

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_darkTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    primaryTextTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Color.fromARGB(235, 27, 27, 27),
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
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
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
          const TextStyle(
            color: Colors.black,
          ),
        ),
        overlayColor: _materialStatePropForElevatedBtn(
          onPressed: const Color.fromARGB(48, 169, 255, 251),
          onHovered: const Color.fromARGB(6, 121, 243, 252),
          byDefault: null,
        ),
        backgroundColor: _materialStatePropForElevatedBtn(
          onPressed: const Color.fromARGB(255, 255, 255, 255),
          onHovered: const Color.fromARGB(255, 224, 224, 224),
          byDefault: const Color.fromARGB(255, 189, 189, 189),
        ),
        elevation: _materialStatePropForElevatedBtn(
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

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    infoSnackbar('theme changed').show();
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}

MaterialStateProperty<T> _materialStatePropForElevatedBtn<T>({
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
