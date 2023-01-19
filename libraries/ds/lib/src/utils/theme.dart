import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  // static TextStyle get title => const TextStyle(
  //       fontSize: 64,
  //       fontWeight: FontWeight.w600,
  //       package: "ds",
  //       fontFamily: "Intel",
  //       color: Color(0xFF1E1E1E),
  // );

  static ThemeData of(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFEEF1F8),
      primarySwatch: Colors.green,
      fontFamily: "packages/ds/Intel",
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(height: 0),
        border: defaultInputBorder,
        enabledBorder: defaultInputBorder,
        focusedBorder: defaultInputBorder,
        errorBorder: defaultInputBorder,
      ),
    );
  }

  static const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(
      color: Color(0xFFDEE3F2),
      width: 1,
    ),
  );
}
