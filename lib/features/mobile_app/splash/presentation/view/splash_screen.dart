import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/mobile_app/splash/presentation/view/widgets/spalsh_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.primary,
      body: const SplashBody(),
    );
  }
}
