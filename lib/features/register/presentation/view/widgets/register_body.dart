import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: PaddingConstants.horizontalMedium,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                children: [
                  Text(
                    'Create Your Account',
                    style: TextStyles.extraLargeBold,
                  ),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Icon(
                    IconlyBroken.profile,
                    color: AppColors.current.blue,
                    size: screenHeight * 0.03,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                'Sign up now to get to personalized account and start your progress.',
                style: TextStyles.medium,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: 'First Name',
                prefixIcon:  Icon(IconlyBroken.profile,
                    color: AppColors.current.blue),
                fillColor: true,
                fillColorValue: AppColors.current.white,
                obscureText: false,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            Expanded(
              child: CustomTextFormField(
                hintText: 'Last Name',
                prefixIcon:  Icon(IconlyBroken.profile,
                    color: AppColors.current.blue),
                obscureText: false,
                keyboardType: TextInputType.name,
                fillColor: true,
                fillColorValue: AppColors.current.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        CustomTextFormField(
          hintText: 'Email',
          prefixIcon:  Icon(IconlyBroken.message,
              color: AppColors.current.blue),
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          fillColor: true,
          fillColorValue: AppColors.current.white,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        CustomTextFormField(
          hintText: 'Password',
          prefixIcon:  Icon(IconlyBroken.lock,
              color: AppColors.current.blue),
          suffixIcon: Icon(IconlyBroken.hide,
              color: AppColors.current.blue),
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          fillColor: true,
          fillColorValue: AppColors.current.white,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        CustomTextFormField(
          hintText: 'Confirm Password',
          prefixIcon:  Icon(IconlyBroken.lock,color:AppColors.current.blue ,),
          suffixIcon: Icon(IconlyBroken.hide,
              color: AppColors.current.blue),
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          fillColor: true,
          fillColorValue: AppColors.current.white,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            return null;
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'By signing up, you agree to our',
              style: TextStyles.medium,
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Text(
              'Terms of Service',
              style: TextStyles.mediumBold.copyWith(
                color: AppColors.current.blue,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'and',
              style: TextStyles.medium,
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Text(
              'Privacy Policy',
              style: TextStyles.mediumBold.copyWith(
                color: AppColors.current.blue,
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        CustomFilledButton(
          text: 'Create Account',
          onPressed: () {
            // Handle sign up action
          },
          backgroundColor: AppColors.current.blue,
          textColor: AppColors.current.white,
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
      ],
    );
  }
}
