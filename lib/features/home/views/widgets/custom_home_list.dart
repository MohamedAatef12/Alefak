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
              avatarUrl:
                  'https://i.pinimg.com/736x/24/35/cd/2435cdf87fdb794825fa5840af1ec200.jpg',
              userName: 'Itachi Uchiha',
              timestamp: '2 hours ago',
              content: 'This is a sample post content.',
              imageUrls: [
                'assets/images/logo.png',
              ],
            );
          },
          childCount: 10,
        ),
      ),
    );
  }
}
