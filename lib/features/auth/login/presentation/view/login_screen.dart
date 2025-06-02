import 'package:alefk/core/config/di/injection_container.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/auth/login/domain/usecases/login_local_use_case.dart';
import 'package:alefk/features/auth/login/domain/usecases/login_use_case.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:alefk/features/auth/login/presentation/view/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.current.primary,

      appBar: AppBar(
        backgroundColor: AppColors.current.primary,
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocProvider(
          create: (context)=> LoginBloc(getIt<LoginUseCase>(),
          getIt<LoginLocalUseCase>()),
          child: const LoginBody())
    );
  }
}
