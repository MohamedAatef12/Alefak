import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_bloc.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_states.dart';
import 'package:alefk/features/auth/register/presentation/view/widgets/register_form.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc,RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          // Show loading indicator
        } else if (state is RegisterSuccess) {
          context.pop();
          Flushbar(
            message: 'Registration successful! Please log in.',
            margin: EdgeInsets.all(20),
            borderRadius: BorderRadius.circular(8),
            backgroundColor: AppColors.current.green,
            duration: Duration(seconds: 5),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        } else if (state is RegisterFailure) {
          // Handle failure, e.g., show an error message
          Flushbar(
            message: 'Registration failed please try again.',
            margin: EdgeInsets.all(20),
            borderRadius: BorderRadius.circular(8),
            backgroundColor: AppColors.current.red,
            duration: Duration(seconds: 5),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },
      child: RegisterForm()
    );
  }
}