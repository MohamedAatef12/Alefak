import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/constants/validators.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/delete_account_bloc.dart';

class DeleteAccountDialog {
  static void show(
    BuildContext context, {
    required void Function(String password) onConfirm,
  }) {
    final bloc = context.read<DeleteAccountBloc>();

    AwesomeDialog(
      context: context,
      dialogBackgroundColor: AppColors.current.white,
      customHeader: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.cover,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Delete Account',
            style: TextStyles.mediumBold.copyWith(
              color: AppColors.current.red,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Deleting your account is permanent and cannot be undone. Please enter your password to confirm.',
            style: TextStyles.medium.copyWith(
              color: AppColors.current.text.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
              controller: bloc.passwordController,
              fillColor: true,
              fillColorValue: AppColors.current.gray.withOpacity(0.5),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              hintText: 'Enter your password',
              labelText: 'Password',
              obscureText: true,
              validator: Validators.validatePassword),
        ],
      ),
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      title: 'Delete Account',
      desc: 'Do you want to delete Your Account?',
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,
      btnOkOnPress: () {
        onConfirm(bloc.passwordController.text);
      },
      btnCancelOnPress: () {},
      btnOkColor: AppColors.current.red,
      btnOkText: 'Yes',
      btnCancelText: 'No',
      btnCancelColor: AppColors.current.gray,
      btnOkIcon: Icons.check_circle,
      btnCancelIcon: Icons.cancel,
      headerAnimationLoop: false,
    ).show();
  }
}
