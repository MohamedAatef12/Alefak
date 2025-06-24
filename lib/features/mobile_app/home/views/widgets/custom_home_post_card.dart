import 'package:alefk/core/constants/sized_box.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:share_plus/share_plus.dart';

import '../../domain/entities/post_entity.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../bloc/home_states.dart';
import 'animated_counter.dart';
import 'custom_bottom_sheet.dart';

class FacebookPostCard extends StatelessWidget {
  final PostEntity post;

  const FacebookPostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(post.imageUrl),
                onBackgroundImageError: (_, __) {},
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  post.username,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyles.large.copyWith(
                    color: AppColors.current.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBoxConstants.verticalMedium,

          // Content
          Text(
            post.text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.medium.copyWith(
              color: AppColors.current.text,
            ),
          ),

          SizedBoxConstants.verticalSmall,

          // Carousel

          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 250,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
              ),
              items: [
                Image.network(
                  post.imageUrl,
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
                )
              ],
            ),
          ),

          // Timestamp
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              post.date.replaceAll('T', ' ').substring(0, 16),
              style: TextStyles.small.copyWith(
                color: AppColors.current.text,
              ),
            ),
          ),

          SizedBoxConstants.verticalSmall,

          Divider(
            color: AppColors.current.gray.withOpacity(0.5),
            thickness: 1.0,
            height: 0.0,
          ),

          SizedBoxConstants.verticalMedium,

          // Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(
                postId: post.id,
                label: "Like",
                context: context,
                index: 0,
              ),
              _buildActionButton(
                postId: post.id,
                label: "Comment",
                context: context,
                index: 1,
              ),
              _buildActionButton(
                postId: post.id,
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

  Widget _buildActionButton({
    required int postId,
    required String label,
    required BuildContext context,
    required int index,
  }) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.likedPostIds != current.likedPostIds ||
          previous.postLikesCount != current.postLikesCount,
      builder: (context, state) {
        final homeBloc = context.read<HomeBloc>();
        final color = AppColors.current.text;
        final textStyle = TextStyles.medium.copyWith(color: color);
        final isLiked = state.likedPostIds.contains(postId);

        Widget iconWidget;
        Widget countWidget = const SizedBox();

        if (label == "Like") {
          final isThrottled = homeBloc.throttledPostIds.contains(postId);
          iconWidget = GestureDetector(
            onTap: isThrottled
                ? null
                : () {
                    final isLiked = post.liked;
                    homeBloc.add(isLiked
                        ? DeleteLikeEvent(postId)
                        : AddLikeEvent(postId));
                  },
            child: Icon(
              IconlyBroken.heart,
              size: 30,
              color: isLiked
                  ? AppColors.current.red
                  : AppColors.current.text.withOpacity(0.7),
            ),
          );

          countWidget = GestureDetector(
            onTap: () => showBottomSheetWithBloc(context, postId, index, label),
            child: AnimatedCounter(
              count: state.postLikesCount[postId] ?? 0,
              style: textStyle,
            ),
          );
        } else if (label == "Comment") {
          iconWidget =
              const Icon(IconlyBroken.chat, color: Colors.blue, size: 30);
          countWidget = GestureDetector(
            onTap: () => showBottomSheetWithBloc(context, postId, index, label),
            child: AnimatedCounter(
              count: state.postCommentsCount[postId] ?? 0,
              style: textStyle,
            ),
          );
        } else {
          iconWidget = GestureDetector(
            onTap: () {
              final link = 'http://alefak.runasp.net/posts/$postId';
              Share.shareUri(Uri.parse(link));
            },
            child: const Icon(
              IconlyBroken.send,
              color: Colors.green,
              size: 30,
            ),
          );
          countWidget = Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(label, style: textStyle),
          );
        }

        return Row(
          children: [
            iconWidget,
            const SizedBox(width: 4),
            countWidget,
          ],
        );
      },
    );
  }

  void showBottomSheetWithBloc(
      BuildContext context, int postId, int index, String label) {
    final homeBloc = context.read<HomeBloc>();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
        minHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (!homeBloc.loadedBottomSheetPostIds.contains(postId)) {
            homeBloc.add(FetchPostsCommentsEvent(postId));
            homeBloc.add(FetchPostsLikesEvent(postId));
            homeBloc.loadedBottomSheetPostIds.add(postId);
          }
        });

        return BlocProvider.value(
          value: homeBloc,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.isCommentsLoading && state.isLikesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.error != null) {
                return Center(child: Text(state.error!));
              } else if (state.posts.isNotEmpty) {
                return BottomSheetContent(
                  postId: postId,
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
    ).whenComplete(() {
      homeBloc.add(ClearPostDetailsEvent());
      homeBloc.loadedBottomSheetPostIds.remove(postId);
      homeBloc.loadedBottomSheetPostIds.clear();
    });
  }
}
