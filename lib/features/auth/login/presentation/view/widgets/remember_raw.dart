import 'package:flutter/material.dart';
import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:go_router/go_router.dart';

class RememberMeRow extends StatelessWidget {
  final double screenWidth;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const RememberMeRow({
    super.key,
    required this.screenWidth,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.horizontalSmall,
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) => onChanged(value ?? false),
            activeColor: AppColors.current.green,
          ),
          Text(
            'Remember Me',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: AppColors.current.text,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.pushNamed('forgot_password');
            },
            child: Text(
              'Forget Password?',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: AppColors.current.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}