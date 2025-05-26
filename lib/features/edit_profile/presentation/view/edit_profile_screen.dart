import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/edit_profile/presentation/view/widgets/edit_profile_body.dart';
import 'package:alefk/features/home/views/widgets/custom_add_post_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.primary,
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyles.largeBold),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrow_left_2),
          onPressed: () {
            context.replace('/settings');
          },
        ),
      ),
      body: const EditProfileBody(),
    );
  }
}
