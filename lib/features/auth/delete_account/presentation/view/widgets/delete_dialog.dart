import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/constants/validators.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:alefk/features/auth/delete_account/presentation/bloc/delete_account_bloc.dart';
import 'package:alefk/features/auth/delete_account/presentation/bloc/delete_account_states.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DeleteAccountDialog {
  static void show(
      BuildContext context, {
        required void Function(String password) onConfirm,
      }) {
    final existingBloc = context.read<DeleteAccountBloc>();

    final isDark = Theme.of(context).brightness == Brightness.dark;
    AppColors.current = isDark ? defaultDarkColors : defaultLightColors;

    AwesomeDialog(
      context: context,
      customHeader: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.cover,
      ),
      body: BlocProvider.value(
        value: existingBloc,
        child: BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
          builder: (context, state) {
            return Column(
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
                  "deleting your account is permanent and cannot be undone. please enter your password to confirm.".tr(),
                  style: TextStyles.medium.copyWith(
                    color: AppColors.current.text.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: existingBloc.passwordController,
                  fillColor: true,
                  fillColorValue: AppColors.current.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: 'enter your password'.tr(),
                  obscureText: true,
                  validator: Validators.validatePassword,
                ),
                const SizedBox(height: 20),
                CustomFilledButton(
                  backgroundColor: AppColors.current.red,
                  text: state is DeleteAccountLoading ? 'Loading...' : 'Delete',
                  onPressed:() { state is DeleteAccountLoading
                      ? null
                      :
                    onConfirm(existingBloc.passwordController.text);
                    existingBloc.passwordController.clear();
                  },
                ),
              ],
            );
          },
        ),
      ),
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(5)),
      title: 'delete_account'.tr(),
      desc: 'do you want to delete your account?'.tr(),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,
      headerAnimationLoop: false,
    ).show(); // ✅ don't pass AwesomeDialog to showDialog, just call .show()
  }
}



