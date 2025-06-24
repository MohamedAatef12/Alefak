import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_states.dart';
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
          return SliverToBoxAdapter(

              // child: Center(
              //   child: Image.asset(
              //     'assets/images/no_data.jpg',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final post = state.posts[index];
              return FacebookPostCard(
                post: post,
              );
            },
            childCount: state.posts.length,
          ),
        );
      },
    );
  }
}
