import 'package:alefk/core/config/di/injection_container.dart';
import 'package:alefk/features/home/domain/usecases/add_comment.dart';
import 'package:alefk/features/home/domain/usecases/add_post.dart';
import 'package:alefk/features/home/domain/usecases/delete_post.dart';
import 'package:alefk/features/home/domain/usecases/get_comments.dart';
import 'package:alefk/features/home/domain/usecases/get_comments_count_post.dart';
import 'package:alefk/features/home/domain/usecases/get_comments_id.dart';
import 'package:alefk/features/home/domain/usecases/get_likes_count_post.dart';
import 'package:alefk/features/home/domain/usecases/get_posts.dart';
import 'package:alefk/features/home/domain/usecases/get_posts_likes.dart';
import 'package:alefk/features/home/views/bloc/home_bloc.dart';
import 'package:alefk/features/home/views/bloc/home_events.dart';
import 'package:alefk/features/home/views/widgets/home_page_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
