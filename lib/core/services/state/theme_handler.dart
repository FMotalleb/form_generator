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
    cardTheme: const CardTheme(
      clipBehavior: Clip.antiAlias,
      color: Color.fromARGB(255, 230, 230, 230),
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
    brightness: Brightness.dark,
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    infoSnackbar('theme changed').show();
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
