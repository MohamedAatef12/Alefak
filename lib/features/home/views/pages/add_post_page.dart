import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/sized_box.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:alefk/features/home/views/widgets/custom_dashed_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.current.primary,
          title: Text(
            'Add Post',
            style: TextStyles.largeBold.copyWith(
              color: AppColors.current.blue,
            ),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: IconlyBrokenIcons.arrowLeft_2,
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        // Background container
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.9,
                          color: AppColors.current.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: IconlyBrokenIcons.upload,
                              ),
                              SizedBoxConstants.horizontalMedium,
                              Text(
                                'Upload Image',
                                style: TextStyles.largeBold.copyWith(
                                  color: AppColors.current.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Dashed border
                        Positioned.fill(
                          child: Padding(
                            padding: const EdgeInsets.all(
                                2.0), // Adjust padding for dash position
                            child: CustomPaint(
                              painter: DashedBorderPainter(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBoxConstants.verticalLarge,
                  CustomTextFormField(
                    hintText: 'Title',
                    fillColor: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    fillColorValue: AppColors.current.white,
                  ),
                  SizedBoxConstants.verticalLarge,
                  CustomTextFormField(
                    hintText: 'Description',
                    fillColor: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 100,
                      horizontal: 20,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    fillColorValue: AppColors.current.white,
                  ),
                  SizedBoxConstants.verticalLarge,
                  CustomTextFormField(
                    hintText: 'Location',
                    fillColor: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    fillColorValue: AppColors.current.white,
                  ),
                  SizedBoxConstants.verticalExtraLarge,
                  CustomFilledButton(
                      text: 'Post',
                      textStyle: TextStyles.largeBold.copyWith(
                        color: AppColors.current.white,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
