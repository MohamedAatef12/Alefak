import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/register/presentation/view/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrow_left_2),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.current.primary,
      ),
      backgroundColor: AppColors.current.primary,
      body: const RegisterBody(),
    );
  }
}
