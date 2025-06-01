import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/validators.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SigningUpTextFields extends StatefulWidget {
  const SigningUpTextFields({super.key});

  @override
  State<SigningUpTextFields> createState() => _SigningUpTextFieldsState();
}

class _SigningUpTextFieldsState extends State<SigningUpTextFields> {
  bool _obscurePassword = true;

  bool _obscureConfirmPassword = true;

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: _firstNameController,
                hintText: 'First Name',
                textInputAction: TextInputAction.next,
                prefixIcon:
                    Icon(IconlyBroken.profile, color: AppColors.current.blue),
                fillColor: true,
                fillColorValue: AppColors.current.white,
                obscureText: false,
                keyboardType: TextInputType.name,
                validator: Validators.validateFName,
              ),
            ),
            Expanded(
              child: CustomTextFormField(
                  controller: _lastNameController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Last Name',
                  prefixIcon:
                      Icon(IconlyBroken.profile, color: AppColors.current.blue),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  fillColor: true,
                  fillColorValue: AppColors.current.white,
                  validator: Validators.validateLName),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.025),
        CustomTextFormField(
            controller: _emailController,
            hintText: 'Email',
            textInputAction: TextInputAction.next,
            prefixIcon:
                Icon(IconlyBroken.message, color: AppColors.current.blue),
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            fillColor: true,
            fillColorValue: AppColors.current.white,
            validator: Validators.validateEmail),
        SizedBox(height: screenHeight * 0.025),
        CustomTextFormField(
            controller: _passwordController,
            hintText: 'Password',
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(IconlyBroken.lock, color: AppColors.current.blue),
            suffixIcon: IconButton(
              color: AppColors.current.blue,
              splashColor: AppColors.current.transparent,
              highlightColor: AppColors.current.transparent,
              icon: _obscurePassword
                  ? IconlyBrokenIcons.hide
                  : IconlyBrokenIcons.show,
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            obscureText: _obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            fillColor: true,
            fillColorValue: AppColors.current.white,
            validator: Validators.validatePassword),
        SizedBox(height: screenHeight * 0.025),
        CustomTextFormField(
            controller: _confirmPasswordController,
            hintText: 'Confirm Password',
            textInputAction: TextInputAction.done,
            prefixIcon: Icon(IconlyBroken.lock, color: AppColors.current.blue),
            obscureText: _obscureConfirmPassword,
            // suffixIcon: IconButton(
            //   color: AppColors.current.blue,
            //   splashColor: AppColors.current.transparent,
            //   highlightColor: AppColors.current.transparent,
            //   icon: _obscureConfirmPassword
            //       ? IconlyBrokenIcons.hide
            //       : IconlyBrokenIcons.show,
            //   onPressed: () {
            //     setState(() {
            //       _obscureConfirmPassword = !_obscureConfirmPassword;
            //     });
            //   },
            // ),
            keyboardType: TextInputType.visiblePassword,
            fillColor: true,
            fillColorValue: AppColors.current.white,
            validator: (value) => Validators.validateConfirmPassword(
                  value,
                  _passwordController.text,
                )),
      ],
    );
  }
}
