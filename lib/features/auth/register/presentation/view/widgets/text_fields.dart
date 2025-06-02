import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/validators.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_bloc.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_events.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class SigningUpTextFields extends StatelessWidget {
  const SigningUpTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<RegisterBloc,RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.current.red,
            ),
          );
        }
      },
      builder: (context ,state) {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: context.read<RegisterBloc>().firstNameController,
                  hintText: 'First Name',
                  textInputAction: TextInputAction.next,
                  prefixIcon:
                      Icon(IconlyBroken.profile, color: AppColors.current.blue),
                  fillColor: true,
                  fillColorValue: AppColors.current.white,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  validator: Validators.validateFName,
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                    controller: context.read<RegisterBloc>().lastNameController,
                    textInputAction: TextInputAction.next,
                    hintText: 'Last Name',
                    prefixIcon:
                        Icon(IconlyBroken.profile, color: AppColors.current.blue),
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    fillColor: true,
                    fillColorValue: AppColors.current.white,
                    validator: Validators.validateLName),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.025),
          CustomTextFormField(
              controller: context.read<RegisterBloc>().emailController,
              hintText: 'Email',
              textInputAction: TextInputAction.next,
              prefixIcon:
                  Icon(IconlyBroken.message, color: AppColors.current.blue),
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              fillColor: true,
              fillColorValue: AppColors.current.white,
              validator: Validators.validateEmail),
          SizedBox(height: screenHeight * 0.025),
          CustomTextFormField(
              controller: context.read<RegisterBloc>().phoneController,
              hintText: 'Phone Number',
              textInputAction: TextInputAction.next,
              prefixIcon:
              Icon(IconlyBroken.call, color: AppColors.current.blue),
              obscureText: false,
              keyboardType: TextInputType.phone,
              fillColor: true,
              fillColorValue: AppColors.current.white,
              validator: Validators.validatePhone),
          SizedBox(height: screenHeight * 0.025),
          CustomTextFormField(
              controller: context.read<RegisterBloc>().passwordController,
              hintText: 'Password',
              textInputAction: TextInputAction.next,
              prefixIcon: Icon(IconlyBroken.lock, color: AppColors.current.blue),
              suffixIcon: IconButton(
                color: AppColors.current.blue,
                splashColor: AppColors.current.transparent,
                highlightColor: AppColors.current.transparent,
                icon: context.watch<RegisterBloc>().obscurePassword
                    ? IconlyBrokenIcons.hide
                    : IconlyBrokenIcons.show,
                onPressed: () {
                  context.read<RegisterBloc>().add(TogglePasswordVisibility());
                },
              ),
              obscureText: context.watch<RegisterBloc>().obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              fillColor: true,
              fillColorValue: AppColors.current.white,
              validator: Validators.validatePassword),
          SizedBox(height: screenHeight * 0.025),
          CustomTextFormField(
              controller: context.read<RegisterBloc>().confirmPasswordController,
              hintText: 'Confirm Password',
              textInputAction: TextInputAction.done,
              prefixIcon: Icon(IconlyBroken.lock, color: AppColors.current.blue),
              obscureText: context.read<RegisterBloc>().obscureConfirmPassword,
              // suffixIcon: IconButton(
              //   color: AppColors.current.blue,
              //   splashColor: AppColors.current.transparent,
              //   highlightColor: AppColors.current.transparent,
              //   icon: _obscureConfirmPassword
              //       ? IconlyBrokenIcons.hide
              //       : IconlyBrokenIcons.show,
              //   onPressed: () {
              //     setState(() {
              //       _obscureConfirmPassword = !_obscureConfirmPassword;
              //     });
              //   },
              // ),
              keyboardType: TextInputType.visiblePassword,
              fillColor: true,
              fillColorValue: AppColors.current.white,
              validator: (value) => Validators.validateConfirmPassword(
                    value,
                    context.read<RegisterBloc>().passwordController.text,
                  )),
        ],
      );
      },
    );
  }
}
