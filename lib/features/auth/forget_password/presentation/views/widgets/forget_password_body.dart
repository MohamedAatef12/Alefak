import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/constants/validators.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ForgetPasswordBody extends StatelessWidget {
final TextEditingController controller = TextEditingController();
   ForgetPasswordBody({super.key,});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: PaddingConstants.horizontalMedium,
          child: Text(
            'Enter your email to reset your password',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: screenHeight* 0.02),
        CustomTextFormField(
            hintText: 'name@Alefak.com',
            textInputAction: TextInputAction.next,
            controller: controller,
            prefixIcon: Icon(IconlyBroken.message, color: AppColors.current.blue),
            fillColor: true,
            fillColorValue: Colors.white,
            validator: Validators.validateEmail
        ),
        Spacer(),
      Center(
        child: CustomFilledButton(
          text: 'Reset Password',
          onPressed: () {},
          textColor: Colors.white,

        ),
      ),
        SizedBox(height: screenHeight * 0.05),
      ]
    );
  }
}
