import 'package:alefk/features/home/domain/entities/comments_entity.dart';
import 'package:alefk/features/home/domain/entities/likes_entity.dart';
import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    super.key,
    required this.index,
    required this.postId,
    required this.comments,
    required this.likes,
  });

  final int index;
  final int postId;
  final List<CommentEntity> comments;
  final List<LikesEntity> likes;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: index,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tab Bar
          const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'Likes'),
              Tab(text: 'Comments'),
            ],
          ),
          // Tab Bar View
          Expanded(
            child: TabBarView(
              children: [
                // Likes Tab
                likes.isEmpty
                    ? const Center(child: Text("No likes yet."))
                    : ListView.builder(
                        itemCount: likes.length,
                        itemBuilder: (context, index) {
                          final like = likes[index];
                          return ListTile(
                            title: Text(like.id.toString()),
                            subtitle: Text(like.date),
                          );
                        },
                      ),

                comments.isEmpty
                    ? const Center(child: Text("No comments yet."))
                    : ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final comment = comments[index];
                          return ListTile(
                            title: Text(comment.text),
                            subtitle: Text(comment.date),
                          );
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
