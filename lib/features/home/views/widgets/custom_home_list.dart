import 'package:alefk/features/home/views/bloc/home_bloc.dart';
import 'package:alefk/features/home/views/bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_home_post_card.dart';

class CustomHomeList extends StatelessWidget {
  const CustomHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isPostsLoading) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const Center(child: CircularProgressIndicator()),
            ),
          );
        }
        if (state.error != null) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.error!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }
        if (state.posts.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('No posts available')),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final post = state.posts[index];
              return FacebookPostCard(
                avatarUrl: post.imageUrl,
                postId: post.id,
                userName: post.username,
                timestamp: post.date,
                content: post.text,
                imageUrls: post.imageUrl == 'string' || post.imageUrl.isEmpty
                    ? []
                    : [post.imageUrl],
              );
            },
            childCount: state.posts.length,
          ),
        );
      },
    );
  }
}
