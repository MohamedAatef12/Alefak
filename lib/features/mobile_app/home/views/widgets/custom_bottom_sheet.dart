import 'package:alefk/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/comments_entity.dart';
import '../../domain/entities/likes_entity.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_states.dart';

class BottomSheetContent extends StatelessWidget {
  final int index;
  final int postId;
  final List<CommentEntity> comments;
  final List<LikesEntity> likes;

  const BottomSheetContent({
    super.key,
    required this.index,
    required this.postId,
    required this.comments,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // final isLoading = state.isCommentsLoading || state.isLikesLoading;

        return DefaultTabController(
          length: 2,
          initialIndex: index,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                indicatorWeight: 2.0,
                dividerHeight: 0,
                splashFactory: NoSplash.splashFactory,
                physics: const BouncingScrollPhysics(),
                enableFeedback: true,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                mouseCursor: SystemMouseCursors.click,
                indicator: BoxDecoration(
                  color: Colors.yellow,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
                tabs: [
                  Tab(icon: Icon(Icons.favorite), text: 'Likes'),
                  Tab(icon: Icon(Icons.comment), text: 'Comments'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildLikesList(state.likes),
                    _buildCommentsList(state.comments),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLikesList(List<LikesEntity> likes) {
    return ListView.builder(
      itemCount: likes.length,
      itemBuilder: (context, index) {
        final like = likes[index];
        return ListTile(
          leading: const Icon(Icons.favorite, color: Colors.red),
          title: Text('User ID: ${like.userID}'),
          subtitle: Text(like.date),
        );
      },
    );
  }

  Widget _buildCommentsList(List<CommentEntity> comments) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return ListTile(
                leading: const Icon(Icons.comment, color: Colors.blue),
                title: Text(comment.text),
                subtitle: Text(comment.date),
              );
            },
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            hintText: 'Add a comment',
          ),
        ),
      ],
    );
  }
}
