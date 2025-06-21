import 'package:alefk/core/config/api/constants.dart';
import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/sized_box.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../bloc/home_states.dart';
import 'custom_bottom_sheet.dart';

class FacebookPostCard extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String timestamp;
  final String content;
  final List<String>? imageUrls;
  final int postId;

  const FacebookPostCard({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.timestamp,
    required this.content,
    required this.postId,
    this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    final validImageUrls = (imageUrls ?? []).where((url) {
      return url.startsWith('http') || url.startsWith('https');
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(avatarUrl),
                onBackgroundImageError: (_, __) {
                  // Handle image loading error
                },
              ),
              const SizedBox(width: 10.0),
              // User Name
              Flexible(
                child: Text(
                  userName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyles.large.copyWith(
                    color: AppColors.current.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Timestamp
            ],
          ),

          SizedBoxConstants.verticalMedium,

          // Post content
          Text(
            content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.medium.copyWith(
              color: AppColors.current.text,
            ),
          ),
          SizedBoxConstants.verticalSmall,

          // Carousel Image Slider
          if (validImageUrls.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 250,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                ),
                items: validImageUrls.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            url,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(Icons.broken_image, size: 50),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            ),

          if (validImageUrls.isNotEmpty) const SizedBox(height: 12.0),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              timestamp.replaceAll('T', ' ').substring(0, 16),
              style: TextStyles.small.copyWith(
                color: AppColors.current.text,
              ),
            ),
          ),
          SizedBoxConstants.verticalSmall,

          // Divider
          Divider(
            color: AppColors.current.gray.withOpacity(0.5),
            thickness: 1.0,
            height: 0.0,
          ),
          SizedBoxConstants.verticalMedium,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(
                postId: postId,
                icon: IconlyBrokenIcons.heart,
                label: "Like",
                context: context,
                index: 0,
              ),
              _buildActionButton(
                postId: postId,
                icon: IconlyBrokenIcons.chat,
                label: "Comment",
                context: context,
                index: 1,
              ),
              _buildActionButton(
                postId: postId,
                icon: IconlyBrokenIcons.send,
                label: "Share",
                context: context,
                index: 2,
              ),
            ],
          ),
          SizedBoxConstants.verticalMedium,
        ],
      ),
    );
  }

  String generatePostShareLink(int postId) {
    return '${Constants.baseUrl}/posts/$postId';
  }

  void sharePost(int postId) {
    final link = generatePostShareLink(postId);
    // Share.share('Check out this post: $link');
    Share.shareUri(Uri.parse(link));
  }

  Widget _buildActionButton({
    required Icon icon,
    required int? postId,
    required String label,
    required BuildContext context,
    required int index,
  }) {
    final homeBloc = context.read<HomeBloc>();

    return InkWell(
      highlightColor: AppColors.current.transparent,
      splashColor: AppColors.current.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        if (label == "Share") {
          sharePost(postId!);
          return;
        }
        showModalBottomSheet(
          isScrollControlled: true,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
            minHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              if (label == "Comment") {
                homeBloc.add(FetchPostsCommentsEvent(postId!));
              }
              if (label == "Like") {
                homeBloc.add(FetchPostsLikesEvent(postId!));
              }
            });
            return BlocProvider.value(
              value: homeBloc,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isCommentsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.error != null) {
                    return Center(child: Text(state.error!));
                  } else if (state.posts.isNotEmpty) {
                    return BottomSheetContent(
                      postId: postId!,
                      index: index,
                      comments: state.comments,
                      likes: state.likes,
                    );
                  }
                  return const Center(child: Text('No data available'));
                },
              ),
            );
          },
        );
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, state) {
          final commentsCount = state.commentsCount[postId] ?? 0;
          final likesCount = state.likesCount[postId] ?? 0;
          return Row(
            children: [
              icon,
              const SizedBox(width: 5.0),
              if (label == "Like")
                Text(
                  likesCount.toString(),
                  style: TextStyles.medium.copyWith(
                    color: AppColors.current.text,
                  ),
                ),
              if (label == "Comment")
                Text(
                  commentsCount.toString(),
                  style: TextStyles.medium.copyWith(
                    color: AppColors.current.text,
                  ),
                ),
              if (label == "Share")
                Text(
                  label,
                  style: TextStyles.medium.copyWith(
                    color: AppColors.current.text,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
