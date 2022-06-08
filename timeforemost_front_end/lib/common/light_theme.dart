import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timeforemost_front_end/common/light_color_config.dart';

class LightTheme {

  //import colors for theme use
  LightColorConfig colorsConfig = LightColorConfig();

  ///Method containing custom settings for the app's theme
  ThemeData theme() {

    return ThemeData(
      scaffoldBackgroundColor: colorsConfig.mainColor,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch(        
        primarySwatch: generateMaterialColor(colorsConfig.primaryColor),
        brightness: Brightness.dark,
        accentColor: colorsConfig.secondaryColor,
        backgroundColor: colorsConfig.backgroundColor,
        errorColor: colorsConfig.errorColor
        //Currently the flutter documentation designates using secondary color but in accentcolor compilations
        // it is the one that performs the effects, leave this comment for possible future changes
      ).copyWith(/* secondary: colorsConfig.secondaryColor*/),

      //Default font in the app
      fontFamily: 'Work Sans',
      textTheme: TextTheme(
        headline1:   TextStyle(fontSize: 96.0, fontWeight: FontWeight.w300, color: colorsConfig.weightTextColor),
        headline2:   TextStyle(fontSize: 60.0, fontWeight: FontWeight.w300, color: colorsConfig.weightTextColor),
        headline3:   TextStyle(fontSize: 48.0, fontWeight: FontWeight.w400, color: colorsConfig.weightTextColor),
        headline4:   TextStyle(fontSize: 34.0, fontWeight: FontWeight.w400, color: colorsConfig.weightTextColor),
        headline5:   TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400, color: colorsConfig.weightTextColor),
        headline6:   TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: colorsConfig.weightTextColor),
        labelMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: colorsConfig.lightTextColor),
        button:      TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: colorsConfig.lightTextColor),
        caption:     TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: colorsConfig.lightTextColor),
        overline:    TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400, color: colorsConfig.lightTextColor),
      ).apply(bodyColor: colorsConfig.weightTextColor),

      //configuration to input like TextFormFields
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colorsConfig.borderColor)),
        hintStyle: TextStyle(color: colorsConfig.hintTextColor),
        labelStyle: TextStyle(color: colorsConfig.lightTextColor),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorsConfig.secondaryColor)),
        prefixIconColor: colorsConfig.prefixIconColor,
        suffixIconColor: colorsConfig.sufixIconColor,
      ).copyWith(),

      //configuration to specific Radio
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(colorsConfig.weightTextColor),
        overlayColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected)? colorsConfig.secondaryColor: colorsConfig.mainColor)
      ),

      // Configuration to specific Checkbox
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color>(colorsConfig.lightTextColor),
        checkColor: MaterialStateProperty.all<Color>(colorsConfig.prefixIconColor)
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(3.0),
          backgroundColor: MaterialStateProperty.all<Color>(colorsConfig.customTextColor),
        )
      ),
      
      //configuration to specific BottomSheet
      bottomSheetTheme: BottomSheetThemeData(modalBackgroundColor: colorsConfig.mainColor),
    );
  }

  ///Function to degrade especific color ligth and dark
  MaterialColor generateMaterialColor(Color color) {
    Map<int, Color> colorArray = {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    };
    return MaterialColor(color.value, colorArray);
  }

  ///Function to change value to specific color in type RGB to be more light
  int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

  ///Function to factorize value to principal colors in RGB
  Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1
  );

  ///Function to change value to specific color in type RGB to be more dark
  int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

  ///Function to factorize value to principal colors in RGB
  Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1
  );
}