// import 'package:alefk/features/home/views/bloc/home_bloc.dart';
// import 'package:alefk/features/home/views/bloc/home_states.dart';
// import 'package:alefk/features/home/views/widgets/custom_home_post_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class PostDetails extends StatelessWidget {
//   final int postId;
//
//   const PostDetails({super.key, required this.postId});
//
//   @override
//   Widget build(BuildContext context) {
//     context.read<HomeBloc>().add(FetchSinglePostEvent(postId));
//     return BlocBuilder<HomeBloc, HomeState>(
//       builder: (context, state) {
//         if (state.isPostsLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state.isPostAdded) {
//           final post = state.post;
//           return FacebookPostCard(
//             avatarUrl: post.imageUrl,
//             postId: post.id,
//             userName: post.username,
//             timestamp: post.date,
//             content: post.text,
//             imageUrls: post.imageUrl == 'string' || post.imageUrl.isEmpty
//                 ? []
//                 : [post.imageUrl],
//           );
//         } else if (state is PostError) {
//           return Center(child: Text('Error: ${state.message}'));
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }
