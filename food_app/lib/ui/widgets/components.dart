import 'package:flutter/material.dart';

class Components {
  static Text text(
    String value, {
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Text(
      value,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
