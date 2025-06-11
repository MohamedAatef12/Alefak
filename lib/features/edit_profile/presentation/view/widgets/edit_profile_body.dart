import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:alefk/features/edit_profile/domain/entity/edit_profile_entity.dart';
import 'package:alefk/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';
import 'package:alefk/features/edit_profile/presentation/bloc/edit_profile_events.dart';
import 'package:alefk/features/edit_profile/presentation/view/widgets/edit_profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProfileBloc>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          EditProfileImage(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            DI.find<ICacheManager>().getUserData()!.userName.toString(),
            style: TextStyles.largeBold.copyWith(
              color: AppColors.current.text,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: DI.find<ICacheManager>().getUserData()!.userName.split(' ').first.toString(),
                  prefixIcon:
                      Icon(IconlyBroken.profile, color: AppColors.current.blue),
                  fillColor: true,
                  controller: bloc.firstNameController,
                  fillColorValue: AppColors.current.white,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  hintText: DI.find<ICacheManager>().getUserData()!.userName.split(' ').last.toString(),
                  prefixIcon:
                      Icon(IconlyBroken.profile, color: AppColors.current.blue),
                  obscureText: false,
                  controller: bloc.lastNameController,
                  keyboardType: TextInputType.name,
                  fillColor: true,
                  fillColorValue: AppColors.current.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextFormField(
            hintText: DI.find<ICacheManager>().getUserData()!.phone.toString(),
            prefixIcon: Icon(IconlyBroken.call, color: AppColors.current.blue),
            fillColor: true,
            controller: bloc.phoneController,
            fillColorValue: AppColors.current.white,
            obscureText: false,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'age',
                  prefixIcon:
                      Icon(Icons.numbers, color: AppColors.current.blue),
                  fillColor: true,
                  fillColorValue: AppColors.current.white,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Gender',
                  prefixIcon:
                      Icon(IconlyBroken.profile, color: AppColors.current.blue),
                  fillColor: true,
                  fillColorValue: AppColors.current.white,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextFormField(
            hintText: 'Address',
            prefixIcon:
                Icon(IconlyBroken.location, color: AppColors.current.blue),
            obscureText: false,
            fillColor: true,
            fillColorValue: AppColors.current.white,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: AppColors.current.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.current.text,
                  width: 0.7,
                ),
              ),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: AppColors.current.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.current.text,
                      width: 0.7,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Your Personal Id Photo',
                        style: TextStyles.smallBold.copyWith(
                          color: AppColors.current.text,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Image.asset('assets/images/add_photo.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomFilledButton(
            text: 'Save Changes',
            onPressed: () {
              final bloc = context.read<EditProfileBloc>();
              final latestUser = DI.find<ICacheManager>().getUserData();
              final updatedEntity = EditProfileEntity(
                email: latestUser!.email,
                userName: '${bloc.firstNameController.text.isNotEmpty ? bloc.firstNameController.text : latestUser.userName.split(' ').first} '
                    '${bloc.lastNameController.text.isNotEmpty ? bloc.lastNameController.text : latestUser.userName.split(' ').last}',
                phone: bloc.phoneController.text.isNotEmpty
                    ? int.tryParse(bloc.phoneController.text) ?? latestUser.phone
                    : latestUser.phone,
                image: latestUser.image, // always use the latest image from cache
                id: latestUser.id,
                password: latestUser.password,
                country: '',
                city: '',
              );
              bloc.add(SaveProfileChangesEvent(updatedEntity));
              final updatedUser = latestUser.copyWith(
                userName: '${bloc.firstNameController.text.isNotEmpty ? bloc.firstNameController.text : latestUser.userName.split(' ').first} '
                    '${bloc.lastNameController.text.isNotEmpty ? bloc.lastNameController.text : latestUser.userName.split(' ').last}',
                phone: bloc.phoneController.text.isNotEmpty
                    ? int.tryParse(bloc.phoneController.text) ?? latestUser.phone
                    : latestUser.phone,
                image: latestUser.image,
              );
              DI.find<ICacheManager>().setUserData(updatedUser);
              context.replaceNamed('bottom');
            },
            backgroundColor: AppColors.current.blue,
            textColor: AppColors.current.white,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
