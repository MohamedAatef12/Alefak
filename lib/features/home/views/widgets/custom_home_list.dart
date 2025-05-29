import 'package:alefk/features/home/views/bloc/home_bloc.dart';
import 'package:alefk/features/home/views/bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_home_post_card.dart';

class CustomHomeList extends StatelessWidget {
  const CustomHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        listener: (BuildContext context, state) {
      if (state is PostError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
    }, builder: (BuildContext context, state) {
      if (state is PostLoading) {
        return SliverToBoxAdapter(
          child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Center(child: CircularProgressIndicator())),
        );
      }

      if (state is PostsLoaded) {
        final posts = state.posts;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final post = posts[index];
              return FacebookPostCard(
                avatarUrl: post.imageUrl,
                userName: post.username,
                timestamp: post.date,
                content: post.text,
                imageUrls: post.imageUrl == 'string' || post.imageUrl.isEmpty
                    ? []
                    : [post.imageUrl],
              );
            },
            childCount: posts.length,
          ),
        );
      }
      if (state is PostError) {
        return SliverToBoxAdapter(
          child: Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        );
      } else {
        // Initial state, no posts loaded yet
        return const SliverToBoxAdapter(
          child: Center(
            child: Text('No posts available'),
          ),
        );
      }
    });
  }
}
