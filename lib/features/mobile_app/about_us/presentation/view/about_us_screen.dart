import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart' show AppColors;
import 'package:alefk/features/mobile_app/about_us/presentation/view/widgets/contactus_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.primary,
      appBar: AppBar(
        title: Text('About Us', style: TextStyles.largeBold),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrow_left_2),
          onPressed: () {
            context.replace('/settings');
          },
        ),
      ),
      body: const AboutUsBody(),
    );
  }
}
