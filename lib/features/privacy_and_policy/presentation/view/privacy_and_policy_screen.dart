import 'package:alefk/core/themes/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
class PrivacyAndPolicyScreen extends StatelessWidget {
  const PrivacyAndPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      backgroundColor: AppColors.current.primary,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        title:  Text('privacy_policy').tr(),
        centerTitle: true,
          leading: IconButton(
            icon:isArabic ?  Icon(IconlyBroken.arrow_right_2) :Icon(IconlyBroken.arrow_left_2) ,
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
