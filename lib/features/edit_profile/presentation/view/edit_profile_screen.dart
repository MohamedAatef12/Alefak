import 'package:alefk/core/config/di/injection_container.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/edit_profile/domain/use_case/edit_profile_use_case.dart';
import 'package:alefk/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';
import 'package:alefk/features/edit_profile/presentation/view/widgets/edit_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.primary,
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyles.largeBold),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrow_left_2),
          onPressed: () {
            context.replaceNamed('bottom');
          },
        ),
      ),
      body: BlocProvider(
          create: (_) => EditProfileBloc(
              getIt<EditProfileUseCase>()
          ),
          child: const EditProfileBody()),
    );
  }
}
