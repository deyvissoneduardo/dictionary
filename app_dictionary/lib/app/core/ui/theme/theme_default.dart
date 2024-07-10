import 'package:flutter/material.dart';

sealed class ThemeDefault {
  static final _defualtInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.blueAccent),
  );

  static final themeDefualt = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey[500],
    cardTheme: const CardTheme(
      elevation: 5,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[500],
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      suffixIconColor: Colors.black,
      prefixIconColor: Colors.black,
      fillColor: Colors.white,
      border: _defualtInputBorder,
      enabledBorder: _defualtInputBorder,
      focusedBorder: _defualtInputBorder,
      disabledBorder: _defualtInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorBorder: _defualtInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
        iconColor: MaterialStatePropertyAll<Color>(Colors.white),
        elevation: MaterialStatePropertyAll<double>(5.0),
        fixedSize: MaterialStatePropertyAll<Size>(Size(80, 65)),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        visualDensity: VisualDensity.compact,
      ),
    ),
  );
}
