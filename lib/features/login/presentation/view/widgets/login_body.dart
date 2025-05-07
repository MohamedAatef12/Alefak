import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:alefk/features/register/presentation/view/register_screen.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(
        'assets/images/frame11.png',
        fit: BoxFit.fitWidth,
        width: screenWidth,
        height: screenHeight * 0.4, // 50% of screen height
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Padding(
        padding: PaddingConstants.horizontalLarge,
        child: Text(
          'Email',
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            color: AppColors.current.text,
          ),
        ),
      ),
      CustomTextFormField(
        hintText: 'Email',
        prefixIcon:IconlyBrokenIcons.message,
        onChanged: (value) {},
        fillColor: true,
        fillColorValue: Colors.white,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Padding(
        padding:  PaddingConstants.horizontalLarge,
        child: Text(
          'Password',
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            color: Colors.black,
          ),
        ),
      ),
      CustomTextFormField(
        hintText: 'Password',
        prefixIcon: IconlyBrokenIcons.lock,
        fillColor: true,
        fillColorValue: Colors.white,
        onChanged: (value) {},
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Padding(
        padding: PaddingConstants.horizontalLarge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
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
            Text(
              'Forget Password?',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: AppColors.current.blue,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding:  PaddingConstants.horizontalLarge,
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.current.text,
                thickness: 0.7,
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
                color: AppColors.current.text,
                thickness: 0.7,
                indent: screenWidth * 0.02,
                endIndent: screenWidth * 0.05,
              ),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Handle Google login
            },
            child: Image.asset('assets/images/icon _google.png',
                width: screenWidth * 0.07, height: screenHeight * 0.07),
          ),
          SizedBox(
            width: screenWidth * 0.2,
          ),
          GestureDetector(
            onTap: () {
              // Handle Facebook login
            },
            child: Image.asset('assets/images/icon _facebook.png',
                width: screenWidth * 0.07, height: screenHeight * 0.07),
          ),
          SizedBox(
            width: screenWidth * 0.2,
          ),
          GestureDetector(
            onTap: () {
              // Handle X login
            },
            child: Image.asset('assets/images/x_icon.png',
                width: screenWidth * 0.07, height: screenHeight * 0.07),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: AppColors.current.text,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ),
              );
            },
            child: Text(
              ' Sign Up',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: AppColors.current.blue,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
Center(
  child: CustomFilledButton(text: 'Login', onPressed: (){}),
)
    ]);
  }
}
