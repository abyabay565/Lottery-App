import 'dart:math';

import 'package:flutter/material.dart';

abstract class Palette {
  static const Color primary = Color(0xFFDC5D0E);
  static const Color yellow = Color(0xFFDCD90E);
  static const Color secondary = Color(0xFFC5520D);


  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);


  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF0000);
  static const Color appBarShadow = Color(0x0a000000);

  static const Color borderGrayColor = Color(0xFFD9D9D9);
  static const Color normalTextColor = Color(0xFF1D1D1D);
  static const Color grayText = Color(0xFF9C9C9C);

  static const Color grayLight = Color(0xFFA19E9E);
  static const Color grayLightEnabled = Color(0xFF646161);

  static const Color dividerColor = Color(0xFFF0F0F0);
  static const Color dividerColor2 = Color(0xFFE1E1E1);
  static const Color lineColor = Color(0xFFE1E1E1);

  static const List<Color> primaryGradient = [
    Color(0xFF543B2D),
    Color(0xFF875441),
  ];
  static const List<Color> primaryGradient50 = [
    Color(0xB3543B2D),
    Color(0xB3875441),
  ];
  static const List<Color> primaryWhiteGradient = [
    Color(0xFF8D5845),
    Color(0x338D5845)
  ];
  static const List<Color> blackWhiteGradient = [
    Color(0x80FFFFFF),
    Color(0x80000000)
  ];
  static const List<Color> lightYellowGradient = [
    Color(0xFFF6F1DE),
    Color(0x00f6f1de)
  ];
  static const List<Color> primaryWhite0Gradient = [
    Color(0xFF8D5845),
    Color(0x1a8d5845)
  ];
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
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
  });
}

int tintValue(int value, double factor) {
  return max(0, min((value + ((255 - value) * factor)).round(), 255));
}

Color tintColor(Color color, double factor) {
  return Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1,
  );
}

int shadeValue(int value, double factor) {
  return max(0, min(value - (value * factor).round(), 255));
}

Color shadeColor(Color color, double factor) {
  return Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1,
  );
}
