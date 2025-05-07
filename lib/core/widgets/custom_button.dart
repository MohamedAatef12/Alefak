import 'package:alefk/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String text; // Button text
  final VoidCallback onPressed; // Callback on press
  final double? widthFactor; // Width factor relative to screen size (optional)
  final double?
      heightFactor; // Height factor relative to screen size (optional)
  final double borderRadius; // Default border radius
  final Color? backgroundColor; // Custom background color (optional)
  final Color? textColor; // Custom text color (optional)
  final TextStyle? textStyle; // Custom text style (optional)

  // Constructor with default properties
  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.widthFactor = 0.8, // Default width relative to screen width (80%)
    this.heightFactor = 0.07, // Default height relative to screen height (7%)
    this.borderRadius = 8.0, // Default border radius
    this.backgroundColor, // Custom background color
    this.textColor, // Custom text color
    this.textStyle, // Custom text style (optional)
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: widthFactor != null ? screenWidth * widthFactor! : null,
      height: heightFactor != null ? screenHeight * heightFactor! : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ??
              AppColors.current.blue, // Use primary color from AppColors
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius), // Rounded corners
          ),
        ),
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: textColor ??
                    AppColors.current.white, // Use white color from AppColors
                fontSize: 16.0, // Default font size
                fontWeight: FontWeight.w600, // Default font weight
              ),
        ),
      ),
    );
  }
}
