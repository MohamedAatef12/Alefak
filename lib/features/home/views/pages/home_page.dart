import 'package:alefk/core/config/di/injection_container.dart';
import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/constants/sized_box.dart';
import 'package:alefk/features/home/domain/usecases/add_comment.dart';
import 'package:alefk/features/home/domain/usecases/add_post.dart';
import 'package:alefk/features/home/domain/usecases/delete_post.dart';
import 'package:alefk/features/home/domain/usecases/get_comments.dart';
import 'package:alefk/features/home/domain/usecases/get_posts.dart';
import 'package:alefk/features/home/views/bloc/home_bloc.dart';
import 'package:alefk/features/home/views/bloc/home_events.dart';
import 'package:alefk/features/home/views/widgets/custom_add_post_button.dart';
import 'package:alefk/features/home/views/widgets/custom_home_list.dart';
import 'package:alefk/features/home/views/widgets/custom_sliver_delegate.dart';
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
          )..add(
              FetchPostsEvent(),
            ),
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: false,
                delegate: CustomSliverAppBarDelegate(),
              ),
              const SliverToBoxAdapter(
                child: SizedBoxConstants.verticalMedium,
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: PaddingConstants.horizontalMedium,
                  child: CustomAddPostButton(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBoxConstants.verticalMedium,
              ),
              const CustomHomeList(),
            ],
          ),
        ),
      ),
    );
  }
}
