//+------------------------------------------------------------------+
//| This is the file that actually contains the theming for the app. |
//+------------------------------------------------------------------+
import 'package:flutter/material.dart';
import 'package:movie_recommendation/theme/palette.dart'; //The palette of colors

class CustomTheme{
  //Static method that returns a ThemeData object as this is what is required
  // by the MaterialApp.
  static ThemeData darkTheme(BuildContext context){
    final theme = Theme.of(context);
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          Palette.red500.value,
          const {
            100: Palette.red100,
            200: Palette.red200,
            300: Palette.red300,
            400: Palette.red400,
            500: Palette.red500,
            600: Palette.red600,
            700: Palette.red700,
            800: Palette.red800,
            900: Palette.red900,
          },
        ),
        accentColor: Palette.red500,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Palette.almostBlack,
      appBarTheme: const AppBarTheme(
        elevation:  0,
        color: Palette.almostBlack,
      ),
      textTheme: theme.primaryTextTheme.copyWith(
        labelLarge: theme.primaryTextTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ).apply(
          // displayColor: Colors.white,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Palette.red500,
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade500,
        thumbColor: Colors.white,
        valueIndicatorColor: Palette.red500,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
    );
  }
}