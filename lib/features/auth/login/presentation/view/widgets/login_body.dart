import 'package:alefk/core/config/notifications/notification_service.dart';
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
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss the keyboard
        },
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: bloc.formKey,
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
                EmailField(),
                SizedBox(height: screenHeight * 0.02),
                PasswordField(),
                SizedBox(height: screenHeight * 0.05),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    final bloc = context.read<LoginBloc>();
                    return RememberMeRow(
                      screenWidth: screenWidth,
                      isChecked: bloc.rememberMe,
                      onChanged: (bool value) {
                        context.read<LoginBloc>().add(ToggleRememberMe(value));
                      },
                    );
                  },
                ),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        Flushbar(
                          message: 'Login Successful',
                          margin: EdgeInsets.all(20),
                          borderRadius: BorderRadius.circular(8),
                          backgroundColor: AppColors.current.green,
                          duration: Duration(seconds: 2),
                          flushbarPosition: FlushbarPosition.TOP,
                        ).show(context);

                        await NotificationService().showNotification(
                          id: state.user.id,
                          title: 'Alefak',
                          body: 'Welcome back ${state.user.userName}',
                        );
                        final role = state.role.toLowerCase();
                        if (role == 'admin') {
                          context.pushReplacementNamed('bottom');
                        } else {
                          context.go('/settings');
                        }
                      });
                    } else if (state is LoginFailure) {
                      Flushbar(
                        message: 'Login failed please try again.',
                        margin: EdgeInsets.all(20),
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: AppColors.current.red,
                        duration: Duration(seconds: 5),
                        flushbarPosition: FlushbarPosition.TOP,
                      ).show(context);
                    }
                  },
                  builder: (context, state) {
                    return Center(
                      child: CustomFilledButton(
                          text: state is LoginLoading ? 'Loading...' : 'Login',
                          onPressed: () {
                            if (state is! LoginLoading) {
                              if (bloc.formKey.currentState?.validate() ??
                                  false) {
                                final model = LoginModel(
                                  email: bloc.emailController.text,
                                  password: bloc.passwordController.text,
                                );
                                context.read<LoginBloc>().add(LoginSubmitted(
                                    model: model, rememberMe: bloc.rememberMe));
                              }
                              //   log(DI
                              //       .find<ICacheManager>()
                              //       .isRemembered()
                              //       .toString());
                              //   log(DI
                              //       .find<ICacheManager>()
                              //       .getUserData()
                              //       .toString());
                            }
                            // log(DI.find<ICacheManager>().isRemembered().toString());
                            // log(DI.find<ICacheManager>().getUserData().toString());
                          }),
                    );
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
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
    );
  }
}
