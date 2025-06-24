import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/auth/delete_account/presentation/view/dialog_view.dart';
import 'package:alefk/features/settings/views/bloc/settings_bloc.dart';
import 'package:alefk/features/settings/views/bloc/settings_events.dart';
import 'package:alefk/features/settings/views/bloc/settings_states.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return BlocConsumer<SettingsBloc, SettingsState>(
      listenWhen: (prev, curr) => prev.isDark != curr.isDark,
      listener: (context, state) {
        AppColors.current = state.isDark ? defaultDarkColors : defaultLightColors;
      },
      builder: (context, state) {
        return ListView(
          children:[Column(
            children: [
              // Account Settings Header
              GestureDetector(
                onTap: () {
                  context.read<SettingsBloc>().add(ToggleAccountSectionEvent());
                },
                child: ListTile(
                  leading: Icon(IconlyBroken.profile, color: AppColors.current.text),
                  title: Text('account_settings'.tr(), style: TextStyles.medium.copyWith(color: AppColors.current.text)),
                  trailing: Icon(
                    state.isAccountSettingsOpen ? IconlyBroken.arrow_down_2 : isArabic? IconlyBroken.arrow_left_2
                        : IconlyBroken.arrow_right_2,
                    color: AppColors.current.text,
                  ),
                ),
              ),

              if (state.isAccountSettingsOpen) ...[
                Padding(
                  padding: PaddingConstants.horizontalMedium,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => context.pushNamed('edit_profile'),
                        child: ListTile(
                          leading: Icon(IconlyBroken.edit, color: AppColors.current.text),
                          title: Text('edit_profile'.tr(), style: TextStyles.medium.copyWith(color: AppColors.current.text)),
                        ),
                      ),
                      DeleteDialogView()
                    ],
                  ),
                ),
              ],

              // Application Settings Header
              GestureDetector(
                onTap: () {
                  context.read<SettingsBloc>().add(ToggleApplicationSectionEvent());
                },
                child: ListTile(
                  leading: Icon(IconlyBroken.setting, color: AppColors.current.text),
                  title: Text('application_settings'.tr(), style: TextStyles.medium.copyWith(color: AppColors.current.text)),
                  trailing: Icon(
                    state.isApplicationSettingsOpen ? IconlyBroken.arrow_down_2 : isArabic? IconlyBroken.arrow_left_2
                        : IconlyBroken.arrow_right_2,
                    color: AppColors.current.text,
                  ),
                ),
              ),

              if (state.isApplicationSettingsOpen) ...[
                Padding(
                  padding: PaddingConstants.horizontalMedium,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.dark_mode_outlined, color: AppColors.current.text),
                        title: Text('dark_mode'.tr(), style: TextStyles.medium.copyWith(color: AppColors.current.text)),
                        trailing: Switch(
                          activeColor: AppColors.current.green,
                          inactiveThumbColor: AppColors.current.text,
                          value: state.isDark,
                          onChanged: (_) {
                            context.read<SettingsBloc>().add(ToggleDarkModeEvent());
                          },
                        ),
                      ),
                      DropdownButton<Locale>(
                        value: context.locale,
                        items:  [
                          DropdownMenuItem(value: Locale('en'), child: Padding(
                            padding: PaddingConstants.horizontalMedium,
                            child: Row(
                              children: [
                                Icon(Icons.translate_outlined,color: AppColors.current.text,),
                                SizedBox(width:15),
                                Text('English'),
                              ],
                            ),
                          )),
                          DropdownMenuItem(value: Locale('ar'), child:  Padding(
                            padding: PaddingConstants.horizontalMedium,
                            child: Row(
                              children: [
                                Icon(Icons.translate_outlined,color: AppColors.current.text,),
                                SizedBox(width:15),
                                Text('العربية'),
                              ],
                            ),
                          ),),
                        ],
                        onChanged: (locale) {
                          if (locale != null) {
                            context.setLocale(locale);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],

              // Static Navigation Items
              _buildNavItem(context, IconlyBroken.lock, 'privacy_policy'.tr(), '/privacy_policy'),
              _buildNavItem(context, IconlyBroken.paper, 'terms'.tr(), '/terms_conditions'),
              _buildNavItem(context, IconlyBroken.info_square, 'about_us'.tr(), '/about_us'),

              // Logout
              GestureDetector(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    customHeader: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
                    buttonsBorderRadius: const BorderRadius.all(Radius.circular(5)),
                    title: 'logout'.tr(),
                    desc: "do_you_want_to_logout_from_your_account?".tr(),
                    dismissOnTouchOutside: true,
                    dismissOnBackKeyPress: true,
                    btnOkOnPress: () {
                      context.goNamed('login');
                      DI.find<ICacheManager>().clearLogin();
                    },
                    btnCancelOnPress: () {},
                    btnOkColor: AppColors.current.red,
                    btnCancelColor: AppColors.current.primary,
                    btnOkText: "yes".tr(),
                    btnCancelText: "no".tr(),
                    btnOkIcon: Icons.check_circle,
                    btnCancelIcon: Icons.cancel,
                    headerAnimationLoop: false,
                  ).show();
                },
                child: ListTile(
                  leading: Icon(IconlyBroken.logout, color: AppColors.current.red),
                  title: Text(
                    'logout'.tr(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.current.red,
                    ),
                  ),
                ),
              ),
            ],
          ),]
        );
      },
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, String route) {
    final isArabic = context.locale.languageCode == 'ar';
    return GestureDetector(
      onTap: () => context.push(route),
      child: ListTile(
        leading: Icon(icon, color: AppColors.current.text),
        title: Text(label, style: TextStyles.medium.copyWith(color: AppColors.current.text)),
        trailing: isArabic
            ? Icon(IconlyBroken.arrow_left_2, color: AppColors.current.text)
            : Icon(IconlyBroken.arrow_right_2, color: AppColors.current.text),
      ),
    );
  }
}
