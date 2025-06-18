import 'package:alefk/features/home/domain/usecases/add_comment.dart';
import 'package:alefk/features/home/domain/usecases/add_post.dart';
import 'package:alefk/features/home/domain/usecases/delete_post.dart';
import 'package:alefk/features/home/domain/usecases/get_comments.dart';
import 'package:alefk/features/home/domain/usecases/get_comments_count_post.dart';
import 'package:alefk/features/home/domain/usecases/get_comments_id.dart';
import 'package:alefk/features/home/domain/usecases/get_likes_count_post.dart';
import 'package:alefk/features/home/domain/usecases/get_posts.dart';
import 'package:alefk/features/home/domain/usecases/get_posts_likes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPostsUseCase getPostsUseCase;
  final AddPostUseCase addPostUseCase;
  final DeletePostUseCase deletePostUseCase;
  final GetCommentsUseCase getCommentsUseCase;
  final AddCommentUseCase addCommentUseCase;
  final GetPostCommentsUseCase getCommentsIdUseCase;
  final GetPostLikesUseCase getPostsLikesUseCase;
  final GetCommentsCountUseCase getCommentsCountUseCase;
  final GetLikesCountUseCase getLikesCountUseCase;

  final TextEditingController postTextController = TextEditingController();

  HomeBloc({
    required this.getPostsUseCase,
    required this.addPostUseCase,
    required this.deletePostUseCase,
    required this.getCommentsUseCase,
    required this.addCommentUseCase,
    required this.getCommentsIdUseCase,
    required this.getPostsLikesUseCase,
    required this.getCommentsCountUseCase,
    required this.getLikesCountUseCase,
  }) : super(const HomeState()) {
    on<FetchPostsEvent>(_onFetchPosts);
    on<AddPostEvent>(_onAddPost);
    on<DeletePostEvent>(_onDeletePost);
    on<FetchCommentsEvent>(_onFetchComments);
    on<FetchPostsCommentsEvent>(_onFetchPostsComments);
    on<AddCommentEvent>(_onAddComment);
    on<FetchPostsLikesEvent>(_onFetchPostsLikes);
    on<FetchCommentCountEvent>(_onFetchCommentCount);
    on<FetchLikesCountEvent>(_onFetchLikesCount);
  }

  // Posts

  Future<void> _onFetchPosts(
      FetchPostsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isPostsLoading: true, error: null));
    final result = await getPostsUseCase.call();

    result.fold(
        (failure) =>
            emit(state.copyWith(isPostsLoading: false, error: failure.message)),
        (posts) {
      emit(state.copyWith(posts: posts, isPostsLoading: false, error: null));
      for (final post in posts) {
        add(FetchCommentCountEvent(post.id));
        add(FetchLikesCountEvent(post.id));
      }
    });
  }

  Future<void> _onAddPost(AddPostEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isAddPostLoading: true, error: null));
    final result = await addPostUseCase.call(event.post);
    await result.fold(
      (failure) async {
        emit(state.copyWith(isAddPostLoading: false, error: failure.message));
      },
      (_) async {
        final postsResult = await getPostsUseCase.call();
        postsResult.fold(
          (failure) => emit(state.copyWith(
              isAddPostLoading: false,
              isPostAdded: false,
              error: failure.message)),
          (posts) => emit(state.copyWith(
              posts: posts,
              isAddPostLoading: false,
              isPostAdded: true,
              error: null)),
        );
      },
    );
  }

  Future<void> _onDeletePost(
      DeletePostEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isPostsLoading: true, error: null));
    final result = await deletePostUseCase.call(event.id);
    result.fold(
      (failure) =>
          emit(state.copyWith(isPostsLoading: false, error: failure.message)),
      (_) async {
        // Optionally, fetch posts again after deleting
        final postsResult = await getPostsUseCase.call();
        postsResult.fold(
          (failure) => emit(
              state.copyWith(isPostsLoading: false, error: failure.message)),
          (posts) => emit(
              state.copyWith(posts: posts, isPostsLoading: false, error: null)),
        );
      },
    );
  }

  // Comments

  Future<void> _onFetchComments(
      FetchCommentsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isCommentsLoading: true, error: null));
    final result = await getCommentsUseCase.call();
    result.fold(
      (failure) => emit(
          state.copyWith(isCommentsLoading: false, error: failure.message)),
      (comments) => emit(state.copyWith(
          comments: comments, isCommentsLoading: false, error: null)),
    );
  }

  Future<void> _onFetchPostsComments(
      FetchPostsCommentsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isCommentsLoading: true, error: null));
    final result = await getCommentsIdUseCase.call(event.postId);
    result.fold(
      (failure) => emit(
          state.copyWith(isCommentsLoading: false, error: failure.message)),
      (comments) {
        emit(
          state.copyWith(
            comments: comments,
            isCommentsLoading: false,
            error: null,
          ),
        );
      },
    );
  }

  Future<void> _onFetchCommentCount(
      FetchCommentCountEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isCommentsLoading: true, error: null));
    final result = await getCommentsCountUseCase.call(event.postId);
    result.fold(
      (failure) => emit(
          state.copyWith(isCommentsLoading: false, error: failure.message)),
      (count) {
        final updatedCommentsCount = Map<int, int>.from(state.commentsCount);
        updatedCommentsCount[event.postId] = count;
        emit(state.copyWith(
          commentsCount: updatedCommentsCount,
          isCommentsLoading: false,
          error: null,
        ));
      },
    );
  }

  Future<void> _onAddComment(
      AddCommentEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isCommentsLoading: true, error: null));
    final result = await addCommentUseCase.call(event.comment);
    result.fold(
      (failure) => emit(
          state.copyWith(isCommentsLoading: false, error: failure.message)),
      (_) async {
        // Optionally, fetch comments for the post again
        final commentsResult =
            await getCommentsIdUseCase.call(event.comment.postID);
        commentsResult.fold(
          (failure) => emit(
              state.copyWith(isCommentsLoading: false, error: failure.message)),
          (comments) {
            final updatedCommentsCount =
                Map<int, int>.from(state.commentsCount);
            updatedCommentsCount[event.comment.postID] = comments.length;
            emit(state.copyWith(
              comments: comments,
              commentsCount: updatedCommentsCount,
              isCommentsLoading: false,
              error: null,
            ));
          },
        );
      },
    );
  }

  // Likes

  Future<void> _onFetchPostsLikes(
      FetchPostsLikesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLikesLoading: true, error: null));
    final result = await getPostsLikesUseCase.call(event.postId);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLikesLoading: false, error: failure.message)),
      (likes) => emit(
          state.copyWith(likes: likes, isLikesLoading: false, error: null)),
    );
  }

  Future<void> _onFetchLikesCount(
      FetchLikesCountEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLikesLoading: true, error: null));
    final result = await getLikesCountUseCase.call(event.postId);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLikesLoading: false, error: failure.message)),
      (count) {
        final updatedLikesCount = Map<int, int>.from(state.likesCount);
        updatedLikesCount[event.postId] = count;
        emit(state.copyWith(
          likesCount: updatedLikesCount,
          isLikesLoading: false,
          error: null,
        ));
      },
    );
  }
}
