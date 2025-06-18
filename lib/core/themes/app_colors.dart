import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _current;
  static AppColors get current => _current ?? defaultLightColors;
  static set current(value) => _current = value;

  AppColors({
    required this.primary,
    required MaterialColor swatch,
    required this.text,
    required this.darkText,
    required this.white,
    required this.green,
    required this.blue,
    required this.red,
    required this.gray,
    required this.yellow,
    required this.teal,
    required this.transparent,
  });
  Color primary;
  Color text;
  Color darkText;
  Color white;
  Color green;
  Color blue;
  Color red;
  Color gray;
  Color yellow;
  Color teal;
  Color transparent;
}

var defaultLightColors = AppColors(
  swatch: const MaterialColor(
    0xffdcebf2,
    <int, Color>{
      50: Color(0xffdcebf2),
      100: Color(0xffdcebf2),
      200: Color(0xffdcebf2),
      300: Color(0xffdcebf2),
      400: Color(0xffdcebf2),
      500: Color(0xffdcebf2),
      600: Color(0xffdcebf2),
      700: Color(0xffdcebf2),
      800: Color(0xffdcebf2),
      900: Color(0xffdcebf2),
    },
  ),
  primary: const Color(0xffdcebf2),
  blue: const Color(0xff4285F4),
  text: const Color(0xff4D4B4B),
  darkText: const Color(0xFFEAEAEA),
  white: const Color(0xffFFFFFF),
  green: const Color(0xff34A853),
  red: const Color(0xffEA4335),
  gray: const Color(0xffD3DDE9),
  yellow: const Color(0xffF9AB00),
  teal: const Color(0xff13D586),
  transparent: Colors.transparent,
);
var defaultDarkColors = AppColors(
  swatch: const MaterialColor(
    0xFF1E1E2F, // Deep background color
    <int, Color>{
      50: Color(0xFF2C2C3E),
      100: Color(0xFF2C2C3E),
      200: Color(0xFF29293A),
      300: Color(0xFF262636),
      400: Color(0xFF232331),
      500: Color(0xFF1E1E2F), // Primary background
      600: Color(0xFF1A1A27),
      700: Color(0xFF161620),
      800: Color(0xFF12121B),
      900: Color(0xFF0F0F17),
    },
  ),
  primary: const Color(0xFF1E1E2F),      // Dark navy background
  blue: const Color(0xFF4F8CFF),         // Soft vibrant blue
  text: const Color(0xFFEAEAEA),
  darkText: const Color(0xff4D4B4B),// Light gray text (not pure white)
  white: const Color(0xFFFFFFFF),        // Pure white (use sparingly)
  green: const Color(0xFF3DDC97),        // Modern mint green
  red: const Color(0xFFFF6B6B),          // Warm red
  gray: const Color(0xFF2F2F3B),         // Card and surface color
  yellow: const Color(0xFFFFC857),       // Warm soft yellow
  teal: const Color(0xFF00C2A8),         // Cool accent
  transparent: Colors.transparent,
);