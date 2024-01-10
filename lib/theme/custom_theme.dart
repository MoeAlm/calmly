import 'package:calmly/theme/palette.dart';
import 'package:flutter/material.dart';

import '../core/constant.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    final theme = Theme.of(context);
    final textScale = MediaQuery.textScalerOf(context);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Cairo',
      primarySwatch: MaterialColor(Palette.black700.value, const {
        100: Palette.black100,
        200: Palette.black200,
        300: Palette.black300,
        400: Palette.black400,
        500: Palette.black500,
        600: Palette.black600,
        700: Palette.black700,
        800: Palette.black800,
        900: Palette.black900,
      }),
      scaffoldBackgroundColor: Palette.white,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        centerTitle: false,
        color: Palette.white,
        titleTextStyle: TextStyle(
          fontSize: textScale.scale(30),
          fontFamily: 'Cairo',
          color: Palette.black700,
        ),
      ),
      textTheme: theme.primaryTextTheme
          .copyWith(
            labelLarge: theme.primaryTextTheme.labelLarge?.copyWith(
              color: Palette.black700,
              fontSize: textScale.scale(16),
              fontWeight: FontWeight.bold,
            ),
          )
          .apply(displayColor: Palette.black700, fontFamily: 'Cairo'),
      checkboxTheme: CheckboxThemeData(
          checkColor: const MaterialStatePropertyAll(Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(kRadius / 5),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Palette.black700,
        foregroundColor: Palette.white,
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Palette.black700,
        ),
      ),
    );
  }
}
