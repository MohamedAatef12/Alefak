import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/constants/validators.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:alefk/features/auth/delete_account/presentation/bloc/delete_account_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountDialog {
  static void show(
      BuildContext context, {
        required void Function(String password) onConfirm,
      }) {
    final bloc = context.read<DeleteAccountBloc>();

    // ✅ Force update color based on current theme
    final isDark = Theme.of(context).brightness == Brightness.dark;
    AppColors.current = isDark ? defaultDarkColors : defaultLightColors;

    AwesomeDialog(
      context: context,
      customHeader: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.cover,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'delete_account'.tr(),
            style: TextStyles.mediumBold.copyWith(
              color: AppColors.current.red,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "deleting your account is permanent and cannot be undone. please enter your password to confirm."
                .tr(),
            style: TextStyles.medium.copyWith(
              color: AppColors.current.text.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: bloc.passwordController,
            fillColor: true,
            fillColorValue: AppColors.current.gray.withOpacity(0.5),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            hintText: 'enter your password'.tr(),
            labelText: 'password'.tr(),
            obscureText: true,
            validator: Validators.validatePassword,
          ),
        ],
      ),
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(5)),
      title: 'delete_account'.tr(),
      desc: 'do you want to delete your account?'.tr(),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,
      btnOkOnPress: () {
        onConfirm(bloc.passwordController.text);
      },
      btnCancelOnPress: () {},
      btnOkColor: AppColors.current.red,
      btnOkText: 'yes'.tr(),
      btnCancelText: 'no'.tr(),
      btnCancelColor: AppColors.current.gray,
      btnOkIcon: Icons.check_circle,
      btnCancelIcon: Icons.cancel,
      headerAnimationLoop: false,
    ).show();
  }

}

