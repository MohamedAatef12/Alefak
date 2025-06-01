import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpWarningText extends StatelessWidget {
  const SignUpWarningText({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('By signing up, you agree to our', style: TextStyles.medium),
             SizedBox(width: screenWidth * 0.01),
             GestureDetector(
                onTap: (){
                  context.pushNamed('terms_conditions');
                },
                child: Text('Terms of Service', style: TextStyles.mediumBold.copyWith(color: AppColors.current.blue))),
          ],
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('and', style: TextStyles.medium),
            SizedBox(width: screenWidth * 0.01),
            GestureDetector(
                onTap: (){
                  context.pushNamed('privacy_policy');
                },
                child: Text('Privacy Policy', style: TextStyles.mediumBold.copyWith(color: AppColors.current.blue))),
          ],
        ),
      ],
    );
  }
}
