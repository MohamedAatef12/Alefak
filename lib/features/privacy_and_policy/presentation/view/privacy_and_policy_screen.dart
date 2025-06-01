import 'package:alefk/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
class PrivacyAndPolicyScreen extends StatelessWidget {
  const PrivacyAndPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.primary,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        title: const Text('Privacy and Policy'),
        centerTitle: true,
          leading: IconButton(
            icon: const Icon(IconlyBroken.arrow_left_2),
            onPressed: () {
              context.pop();
            },
          ),
      ),
      body: const Center(
        child: Text('Privacy and Policy Content'),
      ),
    );
  }
}
