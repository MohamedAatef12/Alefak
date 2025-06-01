import 'package:alefk/core/config/di/injection_container.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:alefk/features/splash/presentation/bloc/splash_event.dart';
import 'package:alefk/features/splash/presentation/bloc/spalsh_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => SplashBloc(getIt())..add(CheckLoginStatus()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            context.pushReplacementNamed('bottom');
          } else if (state is SplashNavigateToLogin) {
            context.pushReplacementNamed('login');
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/images/logo.png',
                    width: screenWidth * 0.4,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Spacer(),
                  SpinKitDoubleBounce(
                    color: AppColors.current.blue,
                    size: screenWidth * 0.09,
                  ),
                  SizedBox(height: screenHeight * 0.1),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}