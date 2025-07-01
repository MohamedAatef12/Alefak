import 'package:flutter/material.dart';

import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:iconly/iconly.dart';

class AgeDropdownWidget extends StatelessWidget {
  final int? selectedAge;
  final ValueChanged<int?> onChanged;

  const AgeDropdownWidget({
    super.key,
    required this.selectedAge,
    required this.onChanged,
  });
  static final List<int> ageOptions = List.generate(83, (index) => index + 18);
  @override
  Widget build(BuildContext context) {
    final value = ageOptions.contains(selectedAge) ? selectedAge : null;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: isDark
          ? AppColors.current.darkText
          : AppColors.current.text,
    );
    return Padding(
      padding: PaddingConstants.horizontalMedium,
      child: DropdownButtonFormField<int>(
        isDense: true,
        menuMaxHeight: 200,
        dropdownColor: AppColors.current.white,
        value: value,
        style: textStyle,
        decoration: InputDecoration(
          prefixIcon: Icon(IconlyBroken.heart, color: AppColors.current.blue),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          fillColor: AppColors.current.white,
          hoverColor: AppColors.current.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: AppColors.current.blue,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.current.white, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.current.white, width: 1),
          ),
        ),
        items: ageOptions
            .map((age) => DropdownMenuItem(
          value: age,
          child: Text(age.toString()),
        ))
            .toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Please select your age' : null,
      ),
    );
  }
}