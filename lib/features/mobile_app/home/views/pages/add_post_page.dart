import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/sized_box.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/core/widgets/custom_button.dart';
import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/author_model.dart';
import '../../domain/entities/post_entity.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../bloc/home_states.dart';
import '../widgets/custom_dashed_border.dart';

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
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state.isPostAdded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Post added successfully')),
                );
                context.pop();
              } else if (state.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error!)),
                );
              }
            },
            builder: (context, state) {
              final bloc = context.read<HomeBloc>();
              return SafeArea(
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
                        controller: bloc.postTextController,
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
                        text: state.isAddPostLoading ? 'Posting...' : 'Post',
                        isLoading: state.isAddPostLoading,
                        onPressed: () async {
                          final post = PostEntity(
                            id: 0,
                            authorID: 0,
                            username: 'dawood',
                            text: bloc.postTextController.text.trim(),
                            date: DateTime.now().toIso8601String(),
                            imageUrl:
                                'https://i.pinimg.com/736x/ad/a0/4b/ada04b70bc73e11555c7daabd96d2804.jpg',
                            author: AuthorModel(
                              id: 0,
                              email: 'dawood@gmail.com',
                              password: '123456',
                              phone: '01012345678',
                              country: 'Egypt',
                              city: 'Cairo',
                              userName: 'dawood',
                              imageUrl:
                                  'https://i.pinimg.com/736x/ad/a0/4b/ada04b70bc73e11555c7daabd96d2804.jpg',
                              age: 25,
                              gender: 'male',
                              address: '123 Main St',
                              idImage:
                                  'https://i.pinimg.com/736x/ad/a0/4b/ada04b70bc73e11555c7daabd96d2804.jpg',
                            ),
                            commentsCount: 0,
                            likesCount: 0,
                            liked: false,
                          );
                          context.read<HomeBloc>().add(AddPostEvent(post));
                          bloc.postTextController.clear();
                          context.pushNamed('/home');
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
