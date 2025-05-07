import 'package:flutter/material.dart';

import 'custom_home_post_card.dart';

class CustomHomeList extends StatelessWidget {
  const CustomHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return const FacebookPostCard(
              avatarUrl: 'https://example.com/avatar.jpg',
              userName: 'John Doe',
              timestamp: '2 hours ago',
              content: 'This is a sample post content.',
              imageUrls: [
                'assets/logo.png',
                'https://example.com/image2.jpg',
                'https://example.com/image2.jpg',
              ],
            );
          },
          childCount: 10, // Number of posts to display
        ),
      ),
    );
  }
}
