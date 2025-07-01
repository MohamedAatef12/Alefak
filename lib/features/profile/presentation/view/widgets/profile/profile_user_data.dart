import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/settings/views/bloc/settings_bloc.dart';
import 'package:alefk/features/settings/views/bloc/settings_states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserData extends StatelessWidget {
  const ProfileUserData(
      {super.key, required this.icon, required this.text, required this.title});
  final Icon icon;
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc,SettingsState>(
      builder: (context,state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
            child: Row(
              children: [
                icon,
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                Text(title, style: TextStyles.medium.copyWith(color: state.isDark? AppColors.current.text: AppColors.current.darkText)),
                Spacer(),
                Text(text.tr(), style: TextStyles.medium.copyWith(color: state.isDark? AppColors.current.text: AppColors.current.darkText),textAlign: TextAlign.center,),
              ],
            ),
          ),
        );
      }
    );
  }
}
