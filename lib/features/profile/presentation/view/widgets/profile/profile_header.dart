import 'package:alefk/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:alefk/features/profile/presentation/bloc/profile_states.dart';
import 'package:alefk/features/profile/presentation/view/widgets/edit_profile/edit_profile_photo.dart';
import 'package:alefk/features/settings/views/bloc/settings_bloc.dart';
import 'package:alefk/features/settings/views/bloc/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc,SettingsState>(
      builder: (context,state1) {
        return BlocBuilder<EditProfileBloc, EditProfileState>(
          builder: (context, state) {
             final double containerHeight = MediaQuery.sizeOf(context).height * 0.15;
            final double profileRadius = MediaQuery.sizeOf(context).height * 0.08;
            final userData = DI.find<ICacheManager>().getUserData()!;

            return SizedBox(
              height: containerHeight + profileRadius, // زيادة كافية لإظهار الجزء الخارج
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: containerHeight,
                    decoration: BoxDecoration(
                      color: AppColors.current.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Directionality(
                      textDirection: Directionality.of(context), // Adapts to current locale
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const EditProfileImage(),
                          SizedBox(width: MediaQuery.sizeOf(context).width*0.04,),
                          Padding(
                            padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.08),
                            child: Column(
                              children: [
                                Text(
                                  userData.userName,
                                  style: TextStyles.mediumBold.copyWith(
                                    color: state1.isDark? AppColors.current.text: AppColors.current.text,
                                  )
                                ),
                                SizedBox(height: MediaQuery.sizeOf(context).height * 0.005),
                                Text(
                                  userData.email,
                                  style: TextStyles.medium.copyWith(
                                    color: state1.isDark? AppColors.current.text: AppColors.current.text.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    );

  }
}
