import 'package:flutter/material.dart';

sealed class TextStyles {
  static bold({double fontSize = 10, Color color = Colors.black}) => TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      );

  static medium({double fontSize = 10, Color color = Colors.black}) =>
      TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.normal,
        fontSize: fontSize,
        color: color,
      );

  static sameBold({double fontSize = 10, Color color = Colors.black}) =>
      TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: color,
      );
}
