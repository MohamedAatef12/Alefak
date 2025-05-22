import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ShopSearch extends StatelessWidget {
  const ShopSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "ابحث عن منتج",
      prefixIcon: IconlyBrokenIcons.search,
      suffixIcon: IconlyBrokenIcons.filter,
      onChanged: (value) {
        // Handle search logic here
      },
      onTap: () {
        // Handle filter logic here
      },
      fillColorValue: AppColors.current.white,
      fillColor: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال قيمة';
        }
        return null;
      },
    );
  }
}
