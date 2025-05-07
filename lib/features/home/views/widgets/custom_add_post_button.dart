import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/radius.dart';
import 'package:alefk/core/constants/sized_box.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAddPostButton extends StatelessWidget {
  const CustomAddPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: RadiusConstants.large,
      splashColor: AppColors.current.blue.withOpacity(0.2),
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.current.white,
          borderRadius: RadiusConstants.large,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconlyBrokenIcons.plus,
            SizedBoxConstants.horizontalMedium,
            Text(
              'Add Post',
              style: TextStyle(
                color: AppColors.current.gray,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
