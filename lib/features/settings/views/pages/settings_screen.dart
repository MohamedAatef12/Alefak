import 'package:alefk/core/config/di/injection_container.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/auth/delete_account/domain/use_cases/delete_account_use_case.dart';
import 'package:alefk/features/auth/delete_account/presentation/bloc/delete_account_bloc.dart';
import 'package:alefk/features/settings/views/bloc/settings_bloc.dart';
import 'package:alefk/features/settings/views/bloc/settings_states.dart';
import 'package:alefk/features/settings/views/pages/widgets/settings_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, themeState) {
        AppColors.current = themeState.isDark ? defaultDarkColors : defaultLightColors;

        return Scaffold(
          backgroundColor: AppColors.current.primary,
          appBar: AppBar(
            title: Text('settings'.tr(), style: TextStyles.largeBold.copyWith(color: AppColors.current.text)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: BlocProvider(
            create: (context) => DeleteAccountBloc(
              getIt<DeleteAccountUseCase>(),
            ),
            child: const SettingsBody(),
          ),
        );
      },
    );
  }
}
