import 'package:alefk/core/config/di/injection_container.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/mobile_app/auth/register/presentation/view/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../domain/usecases/register_domain_usecase.dart';
import '../bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(getIt<RegisterUseCase>()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(IconlyBroken.arrow_left_2),
            onPressed: () {
              context.pop();
            },
          ),
          backgroundColor: AppColors.current.primary,
        ),
        backgroundColor: AppColors.current.primary,
        body: const RegisterBody(),
      ),
    );
  }
}
