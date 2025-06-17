import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/auth/delete_account/presentation/bloc/delete_account_bloc.dart';
import 'package:alefk/features/auth/delete_account/presentation/view/delete_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../../../auth/delete_account/presentation/bloc/delete_account_events.dart';
import '../../../../auth/delete_account/presentation/bloc/delete_account_states.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  bool isAccountSettingsOpen = false;
  bool isApplicationSettingsOpen = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isAccountSettingsOpen = !isAccountSettingsOpen;
                });
              },
              child: ListTile(
                leading: Icon(IconlyBroken.profile, color: AppColors.current.text),
                title: Text('Account', style: TextStyles.medium),
                trailing: Icon(
                  isAccountSettingsOpen ? IconlyBroken.arrow_down_2 : IconlyBroken.arrow_right_2,
                  color: AppColors.current.text,
                ),
              ),
            ),
            if (isAccountSettingsOpen) ...[
              Padding(
                padding: PaddingConstants.horizontalMedium,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.go('/edit_profile');
                      },
                      child: ListTile(
                        leading: Icon(IconlyBroken.edit, color: AppColors.current.text),
                        title: Text('Edit Profile', style: TextStyles.medium),
                      ),
                    ),
                    BlocListener<DeleteAccountBloc,DeleteAccountState>(
                      listener: (context, state) {
                        if (state is DeleteAccountSuccess) {
                          context.goNamed('login');
                          DI.find<ICacheManager>().clearLogin();
                        } else if (state is DeleteAccountFailure) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            title: 'Error',
                            desc: state.message,
                            btnOkOnPress: () {},
                          ).show();
                        }
                      },
                      child: GestureDetector(
                        onTap: () {
                          DeleteAccountDialog.show(context, onConfirm: (password) {
                            final userId = DI.find<ICacheManager>().getUserData()!.id;
                            context.read<DeleteAccountBloc>().add(
                              DeleteAccountRequestedWithPassword(userId: userId, password: password),
                            );
                            // Navigation and clearLogin are handled in BlocListener
                          });
                        },
                        child: ListTile(
                          leading: Icon(IconlyBroken.delete, color: AppColors.current.red),
                          title: Text(
                            'Delete Account',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: AppColors.current.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            GestureDetector(
              onTap: () {
                setState(() {
                  isApplicationSettingsOpen = !isApplicationSettingsOpen;
                });
              },
              child: ListTile(
                leading: Icon(IconlyBroken.setting, color: AppColors.current.text),
                title: Text('Application Settings', style: TextStyles.medium),
                trailing: Icon(
                  isApplicationSettingsOpen ? IconlyBroken.arrow_down_2 : IconlyBroken.arrow_right_2,
                  color: AppColors.current.text,
                ),
              ),
            ),
            if (isApplicationSettingsOpen) ...[
              Padding(
                padding: PaddingConstants.horizontalMedium,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.dark_mode_outlined, color: AppColors.current.text),
                      title: Text('Dark Mode', style: TextStyles.medium),
                      trailing: Switch(
                        activeColor: AppColors.current.green,
                        inactiveThumbColor: AppColors.current.text,
                        value: true,
                        onChanged: (value) {
                          // Handle dark mode toggle
                        },
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.language, color: AppColors.current.text),
                      title: Text('Language', style: TextStyles.medium),
                      trailing: Icon(IconlyBroken.arrow_right_2, color: AppColors.current.text),
                    ),
                  ],
                ),
              ),
            ],
            GestureDetector(
              onTap: () {
                context.go('/privacy_policy');
              },
              child: ListTile(
                leading: Icon(IconlyBroken.lock, color: AppColors.current.text),
                title: Text('Privacy & Policy', style: TextStyles.medium),
                trailing: Icon(IconlyBroken.arrow_right_2, color: AppColors.current.text),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go('/terms_and_conditions');
              },
              child: ListTile(
                leading: Icon(IconlyBroken.paper, color: AppColors.current.text),
                title: Text('Terms & Conditions', style: TextStyles.medium),
                trailing: Icon(IconlyBroken.arrow_right_2, color: AppColors.current.text),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go('/about_us');
              },
              child: ListTile(
                leading: Icon(IconlyBroken.info_square, color: AppColors.current.text),
                title: Text('About Us', style: TextStyles.medium),
                trailing: Icon(IconlyBroken.arrow_right_2, color: AppColors.current.text),
              ),
            ),
            GestureDetector(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  customHeader: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  ),
                  buttonsBorderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  title: 'Logout',
                  desc: 'Do you want to Logout From Your Account?',
                  dismissOnTouchOutside: true,
                  dismissOnBackKeyPress: true,
                  btnOkOnPress: () {
                    context.goNamed('login');
                    DI.find<ICacheManager>().clearLogin();
                  },
                  btnCancelOnPress: () {},
                  btnOkColor: AppColors.current.red,
                  btnOkText: 'Yes',
                  btnCancelText: 'No',
                  btnCancelColor: AppColors.current.primary,
                  btnOkIcon: Icons.check_circle,
                  btnCancelIcon: Icons.cancel,
                  headerAnimationLoop: false,
                ).show();
              },
              child: ListTile(
                leading: Icon(IconlyBroken.logout, color: AppColors.current.red),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.current.red,
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}