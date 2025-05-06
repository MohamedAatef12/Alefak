import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/login/presentation/view/widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.current.primary,
      body: const LoginBody()
    );
  }
}
