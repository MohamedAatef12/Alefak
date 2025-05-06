import 'package:flutter/material.dart';

class TextStyles {
  // Regular Text Styles
  static const TextStyle small =
      TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal);
  static const TextStyle medium =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal);
  static const TextStyle large =
      TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal);
  static const TextStyle extraLarge =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal);

  // Bold Text Styles
  static const TextStyle smallBold =
      TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold);
  static const TextStyle mediumBold =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  static const TextStyle largeBold =
      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  static const TextStyle extraLargeBold =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

  // Italic Text Styles
  static const TextStyle smallItalic =
      TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic);
  static const TextStyle mediumItalic =
      TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic);
  static const TextStyle largeItalic =
      TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic);
  static const TextStyle extraLargeItalic =
      TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic);

  // Customizable Text Styles
  static TextStyle custom({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
    );
  }
}
