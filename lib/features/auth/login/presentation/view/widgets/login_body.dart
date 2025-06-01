import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:alefk/features/auth/login/data/models/login_model.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_events.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_states.dart';
import 'package:alefk/features/auth/login/presentation/view/widgets/email_field.dart';
import 'package:alefk/features/auth/login/presentation/view/widgets/password_field_widget.dart';
import 'package:alefk/features/auth/login/presentation/view/widgets/remember_raw.dart';
import 'package:alefk/features/auth/login/presentation/view/widgets/sign_up_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _onLoginPressed(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final model = LoginModel(
        email: emailController.text,
        password: passwordController.text,
      );
      context.read<LoginBloc>().add(LoginSubmitted(model: model));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss the keyboard
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 ListTile(
                   title: Text(
                     'Welcome Back👋',
                     style: TextStyle(
                       fontSize: screenWidth * 0.06,
                       color: AppColors.current.text,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                    subtitle: Text(
                      'Sign in to access to your personalized account and continue to your progress.',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: AppColors.current.text,
                      ),
                    ),
                 ),
                  SizedBox(height: screenHeight * 0.2),
                  EmailField(controller: emailController),
                  SizedBox(height: screenHeight * 0.02),
                  PasswordField(controller: passwordController),
                  SizedBox(height: screenHeight * 0.05),
                  RememberMeRow(screenWidth: screenWidth),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login Successful')),
                        );
                        context.pushNamed('bottom');
                      } else if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Center(
                        child: CustomFilledButton(
                            text: state is LoginLoading ? 'Loading...' : 'Login',
                            onPressed: (){
                              if (state is! LoginLoading) {
                                _onLoginPressed(context);
                              }
                            }
                        ),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight*0.02,),
                  // OrDivider(screenWidth: screenWidth),
                  // SizedBox(height: screenHeight * 0.01),
                  // SocialLoginRow(screenWidth: screenWidth, screenHeight: screenHeight),
                  // SizedBox(height: screenHeight * 0.01),
                  SignUpPrompt(screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
