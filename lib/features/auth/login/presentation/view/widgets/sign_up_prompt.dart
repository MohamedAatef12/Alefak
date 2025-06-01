import 'package:alefk/features/auth/register/presentation/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:alefk/core/themes/app_colors.dart';

class SignUpPrompt extends StatelessWidget {
  final double screenWidth;
  const SignUpPrompt({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            color: AppColors.current.text,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
          },
          child: Text(
            ' Sign Up',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: AppColors.current.blue,
            ),
          ),
        ),
      ],
    );
  }
}