import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:alefk/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:alefk/features/profile/presentation/bloc/profile_events.dart';
import 'package:alefk/features/profile/presentation/bloc/profile_states.dart';
import 'package:alefk/features/profile/presentation/view/widgets/profile/profile_user_data.dart';
import 'package:alefk/features/settings/views/bloc/settings_bloc.dart';
import 'package:alefk/features/settings/views/bloc/settings_states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
return BlocBuilder<SettingsBloc,SettingsState>(
  builder: (context,state1) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
        builder: (context, state) {
          final userData = DI.find<ICacheManager>().getUserData()!;
          final imagePath = userData.idImage;
          final allItems = [
            Center(
              child: Text('about_me'.tr(),
                  style: TextStyles.mediumBold.copyWith(color:state1.isDark? AppColors.current.text: AppColors.current.darkText),
            ),
            ),
            Divider(indent: 20, endIndent: 20,color: state1.isDark? AppColors.current.text: AppColors.current.darkText,),
            ProfileUserData(
              icon: Icon(Icons.phone, color: state1.isDark? AppColors.current.text: AppColors.current.darkText),
              text: userData.phone.tr(),
              title: 'phone'.tr(),
            ),
            ProfileUserData(
              icon: Icon(IconlyBroken.profile, color: state1.isDark? AppColors.current.text: AppColors.current.darkText),
              text: userData.gender.toString().tr(),
              title: 'gender'.tr(),
            ),
            ProfileUserData(
              icon: Icon(IconlyBroken.heart, color: state1.isDark? AppColors.current.text: AppColors.current.darkText),
              text: userData.age.toString().tr(),
              title: 'age'.tr(),
            ),
            ProfileUserData(
              icon: Icon(Icons.location_city_outlined, color: state1.isDark? AppColors.current.text: AppColors.current.darkText),
              text: userData.city.tr(),
              title: 'city'.tr(),
            ),
            ProfileUserData(
              icon: Icon(Icons.flag_outlined, color: state1.isDark? AppColors.current.text: AppColors.current.darkText),
              text: userData.country.tr(),
              title: 'country'.tr(),
            ),
            ProfileUserData(
              icon: Icon(IconlyBroken.location, color: state1.isDark? AppColors.current.text: AppColors.current.darkText),
              text: userData.address.tr(),
              title: 'address'.tr(),
            ),
            Center(
              child: imagePath == null || imagePath.isEmpty
                  ? Placeholder()
                  : Container(
                decoration: BoxDecoration(
                  color: AppColors.current.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(imagePath),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: CustomFilledButton(
                text: "edit_profile_data".tr(),
                onPressed: () async {
                  final result = await context.push('/profile');
                  if (result == true) {
                    context.read<EditProfileBloc>().add(LoadUserDataEvent());
                  }
                   },
                backgroundColor: AppColors.current.blue,
                textColor: AppColors.current.white,
                borderRadius: 10,
              ),
            ),
          ];
          final isExpanded = state.isExpanded;
          final visibleItems = isExpanded ? allItems : allItems.sublist(0, 4);

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade600, Colors.black12],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...visibleItems,
                    const SizedBox(height: 8),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context.read<EditProfileBloc>().add(const ToggleProfileInfoExpansionEvent());
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isExpanded ? "show_less".tr() : 'show_more'.tr(),
                              style: TextStyle(
                                color: state1.isDark? AppColors.current.text: AppColors.current.darkText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: state1.isDark? AppColors.current.text: AppColors.current.darkText,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
        }
      );
  }
);

  }
}