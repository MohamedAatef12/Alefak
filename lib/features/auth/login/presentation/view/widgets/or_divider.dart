import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
class OrDivider extends StatelessWidget {
  final double screenWidth;
  const OrDivider({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.horizontalLarge,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.current.gray,
              thickness: 2,
              indent: screenWidth * 0.05,
              endIndent: screenWidth * 0.02,
            ),
          ),
          Text(
            'Or',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: AppColors.current.text,
            ),
          ),
          Expanded(
            child: Divider(
              color: AppColors.current.gray,
              thickness: 2,
              indent: screenWidth * 0.02,
              endIndent: screenWidth * 0.05,
            ),
          ),
        ],
      ),
    );
  }
}