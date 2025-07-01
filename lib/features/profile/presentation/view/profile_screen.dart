import 'package:alefk/core/config/di/injection_container.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:alefk/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:alefk/features/profile/presentation/bloc/profile_events.dart';
import 'package:alefk/features/profile/presentation/view/widgets/profile/profile_body.dart';
import 'package:alefk/features/settings/views/bloc/settings_bloc.dart';
import 'package:alefk/features/settings/views/bloc/settings_states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('profile'.tr(), style: TextStyles.largeBold.copyWith(color: AppColors.current.text)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(IconlyBroken.setting),
            onPressed: () {
              context.push('/settings');
            },
          ),
        ],
      ),
      body:
          BlocProvider(
            create: (_) => EditProfileBloc(getIt<EditProfileUseCase>())
              ..add(ChangeTabEvent(0)),
            child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context,state) {
                return const ProfileBody();
              }
            ),));

  }
}
