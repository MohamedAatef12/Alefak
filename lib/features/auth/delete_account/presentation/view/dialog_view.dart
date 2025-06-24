import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/auth/delete_account/presentation/bloc/delete_account_bloc.dart';
import 'package:alefk/features/auth/delete_account/presentation/bloc/delete_account_events.dart';
import 'package:alefk/features/auth/delete_account/presentation/bloc/delete_account_states.dart';
import 'package:alefk/features/auth/delete_account/presentation/view/widgets/delete_dialog.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';


class DeleteDialogView extends StatelessWidget {
  const DeleteDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountBloc, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccess) {
          Flushbar(
            message: 'account_deleted_successfully'.tr(),
            duration: const Duration(seconds: 2),
            flushbarStyle: FlushbarStyle.FLOATING,
            backgroundColor: AppColors.current.green,
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context).then((_) {
            context.goNamed('login');
            DI.find<ICacheManager>().clearLogin();
            context.read<DeleteAccountBloc>().add(DeleteAccountReset());
          });
        }
      if (state is DeleteAccountFailure) {
          Flushbar(
            message: "Wrong Password.",
            duration: const Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Colors.red,
          ).show(context);
    }
      },

      child: GestureDetector(
          onTap: () {
            DeleteAccountDialog.show(
              context,
              onConfirm: (password) {
                if (password.isNotEmpty) {
                  context.read<DeleteAccountBloc>().add(
                    DeleteAccountRequestedWithPassword(password: password),
                  );
                }
              },
            );
          },
          child: ListTile(
            leading: Icon(IconlyBroken.delete, color: AppColors.current.red),
            title: Text(
              'delete_account'.tr(),
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: AppColors.current.red,
              ),
            ),
          ))

    );
  }
  }

