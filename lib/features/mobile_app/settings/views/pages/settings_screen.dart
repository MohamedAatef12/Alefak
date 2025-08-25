import 'package:alefk/core/config/di/injection_container.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/mobile_app/settings/views/pages/widgets/settings_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/delete_account/domain/use_cases/delete_account_use_case.dart';
import '../../../auth/delete_account/presentation/bloc/delete_account_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.primary,
      appBar: AppBar(
        title: Text('Settings', style: TextStyles.largeBold),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider(
          create: (context) => DeleteAccountBloc(getIt<DeleteAccountUseCase>()),
          child: const SettingsBody()),
    );
  }
}
