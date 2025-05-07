import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:alefk/features/edit_profile/presentation/view/widgets/edit_profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const EditProfileImage(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'First Name',
                  prefixIcon:  Icon(IconlyBroken.profile,
                      color: AppColors.current.blue),
                  fillColor: true,
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
                  hintText: 'Last Name',
                  prefixIcon:  Icon(IconlyBroken.profile,
                      color: AppColors.current.blue),
                  obscureText: false,
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
            hintText: 'Phone Number',
            prefixIcon:  Icon(IconlyBroken.call,
                color: AppColors.current.blue),
            fillColor: true,
            fillColorValue: AppColors.current.white,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
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
                child:CustomTextFormField(
                  hintText: 'Age',
                  prefixIcon:  Icon(Icons.numbers,
                      color: AppColors.current.blue),
                  fillColor: true,
                  fillColorValue: AppColors.current.white,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(child:
              CustomTextFormField(
                hintText: 'Gender',
                prefixIcon:  Icon(IconlyBroken.profile,
                    color: AppColors.current.blue),
                fillColor: true,
                fillColorValue: AppColors.current.white,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
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
            prefixIcon:  Icon(IconlyBroken.location,
                color: AppColors.current.blue),
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
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
              // Handle save changes action
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
