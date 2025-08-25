import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  final int postId;
  const PostDetailsPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post $postId')),
      body: Center(child: Text('Display post details for ID: $postId')),
    );
  }
}
