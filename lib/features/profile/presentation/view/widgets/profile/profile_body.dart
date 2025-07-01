import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:alefk/features/profile/presentation/bloc/profile_events.dart';
import 'package:alefk/features/profile/presentation/bloc/profile_states.dart';
import 'package:alefk/features/profile/presentation/view/widgets/profile/profile_header.dart';
import 'package:alefk/features/profile/presentation/view/widgets/profile/profile_info_card.dart';
import 'package:alefk/features/settings/views/bloc/settings_bloc.dart';
import 'package:alefk/features/settings/views/bloc/settings_states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state1) {
      return BlocBuilder<EditProfileBloc, EditProfileState>(
        buildWhen: (previous, current) {
          // Only rebuild if the image changes (for both network and base64)
          if (previous is ProfileImagePicked && current is ProfileImagePicked) {
            return previous.base64Image != current.base64Image;
          }
          return previous is! ProfileImagePicked &&
              current is ProfileImagePicked;
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
             children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                // Only rebuild ProfileHeader when the image changes
                ProfileHeader(),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                ProfileInfoCard(),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black12,
                                Colors.blueAccent.shade200
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: TabBar(
                            labelColor: state1.isDark
                                ? AppColors.current.text
                                : AppColors.current
                                    .darkText, // Selected tab text color
                            unselectedLabelColor: state1.isDark? AppColors.current.text: Colors.black54, // Unselected tab text color
                            labelStyle: TextStyle(
                                fontWeight: FontWeight
                                    .bold), // Optional: style for selected
                            unselectedLabelStyle:
                                TextStyle(fontWeight: FontWeight.normal),
                            dividerColor: AppColors.current.transparent,
                            indicatorColor:
                            state1.isDark? AppColors.current.text: AppColors.current.darkText, // Tab indicator color
                            tabs: [
                              Tab(text: 'my_posts'.tr()),
                              Tab(text: 'my_orders'.tr()),
                              Tab(text: 'my_reports'.tr()),
                            ],
                            onTap: (index) {
                              context
                                  .read<EditProfileBloc>()
                                  .add(ChangeTabEvent(index));
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        SizedBox(
                          height: 250,
                          child:
                              BlocBuilder<EditProfileBloc, EditProfileState>(
                            buildWhen: (previous, current) =>
                                previous.items != current.items ||
                                previous.tabIndex != current.tabIndex,
                            builder: (context, state) {
                              final items = state.items;
                              return ListView.builder(
                                itemCount: items.length,

                                itemBuilder: (context, index) {
                                  return ListTile(
                                      title: Text(
                                    items[index].toString(),
                                    style: TextStyles.medium.copyWith(
                                        color: AppColors.current.red),
                                  ));
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
