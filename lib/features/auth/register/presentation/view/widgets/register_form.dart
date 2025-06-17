import 'dart:math';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/features/auth/register/domain/entities/register_domain_entity.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_bloc.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_events.dart';
import 'package:alefk/features/auth/register/presentation/view/widgets/text_fields.dart';
import 'package:alefk/features/auth/register/presentation/view/widgets/warning.dart';
import 'package:flutter/material.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bloc = context.read<RegisterBloc>();
        return Form(
          key: context.read<RegisterBloc>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: PaddingConstants.horizontalMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Text('Create Your Account',
                            style: TextStyles.extraLargeBold),
                        SizedBox(width: screenWidth * 0.05),
                        Icon(
                            IconlyBroken.profile, color: AppColors.current.blue,
                            size: screenHeight * 0.03),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Sign up now to get to personalized account and start your progress.',
                      style: TextStyles.medium,
                    ),
                    SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
              SigningUpTextFields(),
              SizedBox(height: screenHeight * 0.025),
              SignUpWarningText(),
              SizedBox(height: screenHeight * 0.025),
              CustomFilledButton(
                text: 'Create Account',
                onPressed: () {
                  if (bloc.formKey.currentState?.validate() ?? false) {
                    final userName = '${bloc.firstNameController.text} ${bloc.lastNameController.text}';
                    final randomId = Random().nextInt(900000000) + 100000000; // 9-digit random number

                    final entity = RegisterEntity(
                      id: randomId,
                      email: bloc.emailController.text,
                      password: bloc.passwordController.text,
                      userName: userName,
                      phone:'' ,
                      country: '',
                      city: '',
                      image: 'https://example.com/default_image.png',
                      gender: '',
                      age: 0,
                      address: '',
                      idImage: '',
                    );
                    bloc.add(RegisterSubmitted(entity));

                  }
                },
                backgroundColor: AppColors.current.blue,
                textColor: AppColors.current.white,
              ),
            ],
          ),
        );
      }
}
