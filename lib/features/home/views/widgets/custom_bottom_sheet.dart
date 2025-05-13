import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key, required this.index});

  final int index;

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
                Center(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text('User $index'),
                        subtitle: const Text('Liked this post.'),
                      );
                    },
                  ),
                ),
                // Comments Tab
                Center(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text('User $index'),
                        subtitle: const Text('This is a comment.'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
