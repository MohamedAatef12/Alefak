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
import 'package:alefk/features/edit_profile/presentation/view/widgets/select_age_widget.dart';
import 'package:alefk/features/edit_profile/presentation/view/widgets/select_city.dart';
import 'package:alefk/features/edit_profile/presentation/view/widgets/select_country.dart';
import 'package:alefk/features/edit_profile/presentation/view/widgets/select_gender.dart';
import 'package:alefk/features/edit_profile/presentation/view/widgets/select_personal_id_photo.dart';
import 'package:easy_localization/easy_localization.dart';
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
                  hintText: DI
                      .find<ICacheManager>()
                      .getUserData()!
                      .userName
                      .split(' ')
                      .first
                      .toString()
                      .tr(),
                  prefixIcon: Icon(
                    IconlyBroken.profile,
                    color: AppColors.current.blue,
                  ),
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
                  hintText: DI
                      .find<ICacheManager>()
                      .getUserData()!
                      .userName
                      .split(' ')
                      .last
                      .toString(),
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
            hintText: (DI
                        .find<ICacheManager>()
                        .getUserData()!
                        .phone
                        .toString()
                        .isNotEmpty ??
                    false)
                ? (DI.find<ICacheManager>().getUserData()!.phone.toString())
                : 'Enter Your Phone Number',
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
          GenderDropdownWidget(
            selectedGender: bloc.selectedGender ??
                DI.find<ICacheManager>().getUserData()!.gender,
            onChanged: (value) {
              bloc.selectedGender = value;
              bloc.genderController.text = value?.toString() ?? '';
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          AgeDropdownWidget(
            selectedAge:
                bloc.selectedAge ?? DI.find<ICacheManager>().getUserData()!.age,
            onChanged: (value) {
              bloc.selectedAge = value;
              bloc.ageController.text = value?.toString() ?? '';
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CountryDropdownWidget(
            selectedCountry: bloc.selectedCountry ??
                DI.find<ICacheManager>().getUserData()!.country,
            onChanged: (value) {
              bloc.selectedCountry = value;
              bloc.countryController.text = value?.toString() ?? '';
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          CityDropdownWidget(
            selectedCity: bloc.selectedCity ??
                DI.find<ICacheManager>().getUserData()!.city,
            onChanged: (value) {
              bloc.selectedCity = value;
              bloc.cityController.text = value?.toString() ?? '';
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextFormField(
            hintText: (DI
                        .find<ICacheManager>()
                        .getUserData()!
                        .address
                        .toString()
                        .isNotEmpty ??
                    false)
                ? DI.find<ICacheManager>().getUserData()!.address.toString().tr()
                : 'enter_your_address'.tr(),
            prefixIcon:
                Icon(IconlyBroken.location, color: AppColors.current.blue),
            obscureText: false,
            fillColor: true,
            fillColorValue: AppColors.current.white,
            controller: bloc.addressController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please_enter_your_address'.tr();
              }
              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SelectPersonalIdImage(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomFilledButton(
            text: 'save_changes'.tr(),
            onPressed: () {
              final bloc = context.read<EditProfileBloc>();
              final latestUser = DI.find<ICacheManager>().getUserData();
              final updatedEntity = EditProfileEntity(
                email: latestUser!.email,
                userName:
                    '${bloc.firstNameController.text.isNotEmpty ? bloc.firstNameController.text : latestUser.userName.split(' ').first} '
                    '${bloc.lastNameController.text.isNotEmpty ? bloc.lastNameController.text : latestUser.userName.split(' ').last}',
                phone: bloc.phoneController.text.isNotEmpty
                    ? bloc.phoneController.text
                    : latestUser.phone.toString(),
                image:
                    latestUser.image, // always use the latest image from cache
                id: latestUser.id,
                password: latestUser.password,
                country: bloc.countryController.text.isNotEmpty
                    ? bloc.countryController.text
                    : latestUser.country,
                city: bloc.cityController.text.isNotEmpty
                    ? bloc.cityController.text
                    : latestUser.city,
                age: bloc.ageController.text.isNotEmpty
                    ? int.tryParse(bloc.ageController.text) ?? latestUser.age
                    : latestUser.age,
                gender: bloc.genderController.text.isNotEmpty
                    ? bloc.genderController.text
                    : latestUser.gender,
                address: bloc.addressController.text.isNotEmpty
                    ? bloc.addressController.text
                    : latestUser.address,
                idImage: latestUser.idImage,
              );
              bloc.add(SaveProfileChangesEvent(updatedEntity));
              final updatedUser = latestUser.copyWith(
                userName:
                    '${bloc.firstNameController.text.isNotEmpty ? bloc.firstNameController.text : latestUser.userName.split(' ').first} '
                    '${bloc.lastNameController.text.isNotEmpty ? bloc.lastNameController.text : latestUser.userName.split(' ').last}',
                phone: bloc.phoneController.text.isNotEmpty
                    ? bloc.phoneController.text
                    : latestUser.phone.toString(),
                age: bloc.ageController.text.isNotEmpty
                    ? int.tryParse(bloc.ageController.text) ?? latestUser.age
                    : latestUser.age,
                gender: bloc.genderController.text.isNotEmpty
                    ? bloc.genderController.text
                    : latestUser.gender,
                address: bloc.addressController.text.isNotEmpty
                    ? bloc.addressController.text
                    : latestUser.address,
                country: bloc.countryController.text.isNotEmpty
                    ? bloc.countryController.text
                    : latestUser.country,
                city: bloc.cityController.text.isNotEmpty
                    ? bloc.cityController.text
                    : latestUser.city,
              );
              DI.find<ICacheManager>().setUserData(updatedUser);
              context.pop();
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
