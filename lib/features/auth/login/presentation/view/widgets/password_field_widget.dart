import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/constants/validators.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;

  const PasswordField({
    required this.controller,
    this.hintText = 'Password',
    this.validator,
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: PaddingConstants.horizontalMedium,
          child: Text(
            'Password',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: AppColors.current.text,
            ),
          ),
        ),
        CustomTextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          hintText: widget.hintText,
          textInputAction: TextInputAction.done,
          prefixIcon: Icon(IconlyBroken.lock, color: AppColors.current.blue),
          suffixIcon: IconButton(
            color: AppColors.current.blue,
            splashColor: AppColors.current.transparent,
            highlightColor: AppColors.current.transparent,
            icon: _obscureText? IconlyBrokenIcons.hide:
                IconlyBrokenIcons.show,

            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          fillColor: true,
          fillColorValue: Colors.white,
          validator: Validators.validatePassword,
        ),
      ],
    );
  }
}