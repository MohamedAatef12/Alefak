import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomHomeSearchBar extends StatelessWidget {
  const CustomHomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Search',
      prefixIcon: Icons.search,
      fillColor: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.current.gray,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.current.primary,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.current.gray,
          width: 1,
        ),
      ),
    );
  }
}
