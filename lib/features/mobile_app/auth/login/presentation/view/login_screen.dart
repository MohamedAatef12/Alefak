import 'package:alefk/core/config/di/injection_container.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/mobile_app/auth/login/presentation/view/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_use_case.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.current.primary,
        appBar: AppBar(
          backgroundColor: AppColors.current.primary,
          centerTitle: true,
          elevation: 0,
        ),
        body: BlocProvider(
            create: (context) => LoginBloc(
                  getIt<LoginUseCase>(),
                ),
            child: const LoginBody()));
  }
}
