import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/constants/validators.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key,});
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: PaddingConstants.horizontalMedium,
          child: Text(
            'Email',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: AppColors.current.text,
            ),
          ),
        ),
        CustomTextFormField(
            hintText: 'name@Alefak.com',
            textInputAction: TextInputAction.next,
            controller: bloc.emailController,
            prefixIcon: Icon(IconlyBroken.message, color: AppColors.current.blue),
            fillColor: true,
            obscureText: false,
            fillColorValue: Colors.white,
            validator: Validators.validateEmail,
        ),
      ],
    );
  }
}