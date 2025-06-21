import 'package:alefk/core/config/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/add_comment.dart';
import '../../domain/usecases/add_post.dart';
import '../../domain/usecases/delete_post.dart';
import '../../domain/usecases/get_comments.dart';
import '../../domain/usecases/get_comments_count_post.dart';
import '../../domain/usecases/get_comments_id.dart';
import '../../domain/usecases/get_likes_count_post.dart';
import '../../domain/usecases/get_posts.dart';
import '../../domain/usecases/get_posts_likes.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../widgets/home_page_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeBloc(
            getPostsUseCase: getIt<GetPostsUseCase>(),
            addPostUseCase: getIt<AddPostUseCase>(),
            deletePostUseCase: getIt<DeletePostUseCase>(),
            getCommentsUseCase: getIt<GetCommentsUseCase>(),
            addCommentUseCase: getIt<AddCommentUseCase>(),
            getCommentsIdUseCase: getIt<GetPostCommentsUseCase>(),
            getPostsLikesUseCase: getIt<GetPostLikesUseCase>(),
            getCommentsCountUseCase: getIt<GetCommentsCountUseCase>(),
            getLikesCountUseCase: getIt<GetLikesCountUseCase>(),
          )..add(
              FetchPostsEvent(),
            ),
          child: HomePageContent(),
        ),
      ),
    );
  }
}
