import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart' show AppColors;
import 'package:alefk/features/about_us/presentation/view/widgets/contactus_body.dart' show AboutUsBody;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      backgroundColor: AppColors.current.primary,
      appBar: AppBar(
        title: Text('about_us'.tr(), style: TextStyles.largeBold),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon:isArabic ?  Icon(IconlyBroken.arrow_right_2) :Icon(IconlyBroken.arrow_left_2),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: const AboutUsBody(),

    );
  }
}
