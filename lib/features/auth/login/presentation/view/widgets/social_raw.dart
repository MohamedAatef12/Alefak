import 'package:flutter/material.dart';
class SocialLoginRow extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const SocialLoginRow({super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/icon _google.png',
              width: screenWidth * 0.07, height: screenHeight * 0.07),
        ),
        SizedBox(width: screenWidth * 0.2),
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/icon _facebook.png',
              width: screenWidth * 0.07, height: screenHeight * 0.07),
        ),
        SizedBox(width: screenWidth * 0.2),
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/x_icon.png',
              width: screenWidth * 0.07, height: screenHeight * 0.07),
        ),
      ],
    );
  }
}