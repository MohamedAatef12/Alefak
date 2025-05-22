import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/settings/views/pages/widgets/settings_body.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.current.primary,
      appBar: AppBar(
        title: Text('Settings', style: TextStyles.largeBold),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: const SettingsBody(),
    );
  }
}
