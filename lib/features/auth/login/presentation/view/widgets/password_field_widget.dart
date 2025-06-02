import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/constants/validators.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bloc = context.read<LoginBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: PaddingConstants.horizontalMedium,
          child: Text(
            'Password',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: AppColors.current.text,
            ),
          ),
        ),
        CustomTextFormField(
          controller: bloc.passwordController,
          obscureText: bloc.obscurePassword,
          hintText: 'Password',
          textInputAction: TextInputAction.done,
          prefixIcon: Icon(IconlyBroken.lock, color: AppColors.current.blue),
          suffixIcon: IconButton(
            color: AppColors.current.blue,
            splashColor: AppColors.current.transparent,
            highlightColor: AppColors.current.transparent,
            icon: context.watch<LoginBloc>().obscurePassword
                ? IconlyBrokenIcons.hide
                : IconlyBrokenIcons.show,
            onPressed: () {
              context.read<LoginBloc>().add(TogglePasswordVisibility());
            },
          ),
          fillColor: true,
          fillColorValue: Colors.white,
          validator: Validators.validatePassword,
        ),
      ],
    );
  }
}