import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/mobile_app/auth/forget_password/presentation/views/widgets/forget_password_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forget Password'),
          backgroundColor: AppColors.current.primary,
          centerTitle: true,
          leading: IconButton(
            icon: IconlyBrokenIcons.arrowLeft_2,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ForgetPasswordBody());
  }
}
