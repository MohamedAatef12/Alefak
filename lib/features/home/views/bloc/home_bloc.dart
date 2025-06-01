import 'package:alefk/features/home/domain/usecases/add_comment.dart';
import 'package:alefk/features/home/domain/usecases/add_post.dart';
import 'package:alefk/features/home/domain/usecases/delete_post.dart';
import 'package:alefk/features/home/domain/usecases/get_comments.dart';
import 'package:alefk/features/home/domain/usecases/get_posts.dart';
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

  final TextEditingController postTextController = TextEditingController();

  HomeBloc({
    required this.getPostsUseCase,
    required this.addPostUseCase,
    required this.deletePostUseCase,
    required this.getCommentsUseCase,
    required this.addCommentUseCase,
  }) : super(PostInitial()) {
    on<FetchPostsEvent>(_onFetchPosts);
    on<AddPostEvent>(_onAddPost);
    on<DeletePostEvent>(_onDeletePost);
    // on<EditPostEvent>(_onEditPost);
    on<FetchCommentsEvent>(_onFetchComments);
    on<AddCommentEvent>(_onAddComment);
    // on<EditCommentEvent>(_onEditComment);
    // on<DeleteCommentEvent>(_onDeleteComment);
  }

  Future<void> _onFetchPosts(
      FetchPostsEvent event, Emitter<HomeState> emit) async {
    emit(PostLoading());
    final result = await getPostsUseCase.call();
    result.fold(
      (failure) => emit(PostError(failure.message)),
      (posts) => emit(PostsLoaded(posts)),
    );
  }

  Future<void> _onAddPost(AddPostEvent event, Emitter<HomeState> emit) async {
    emit(AddPostLoading());
    final result = await addPostUseCase.call(event.post);
    result.fold(
      (failure) => emit(AddPostError(failure.message)),
      (_) => emit(AddPostSuccess(event.post)),
    );
  }

  Future<void> _onDeletePost(
      DeletePostEvent event, Emitter<HomeState> emit) async {
    emit(PostLoading());
    final result = await deletePostUseCase.call(event.id);
    result.fold(
      (failure) => emit(PostError(failure.message)),
      (_) => emit(PostActionSuccess()),
    );
  }

  Future<void> _onFetchComments(
      FetchCommentsEvent event, Emitter<HomeState> emit) async {
    emit(PostLoading());
    final result = await getCommentsUseCase.call();
    result.fold(
      (failure) => emit(PostError(failure.message)),
      (comments) => emit(CommentsLoaded(comments)),
    );
  }

  Future<void> _onAddComment(
      AddCommentEvent event, Emitter<HomeState> emit) async {
    emit(PostLoading());
    final result = await addCommentUseCase.call(
      event.comment,
    );
    result.fold(
      (failure) => emit(PostError(failure.message)),
      (_) => emit(PostActionSuccess()),
    );
  }

  // Future<void> _onEditPost(EditPostEvent event, Emitter<HomeState> emit) async {
  //   emit(PostLoading());
  //   final result = await useCases.editPost(event.post);
  //   result.fold(
  //     (failure) => emit(PostError(failure.message)),
  //     (_) => emit(PostActionSuccess()),
  //   );
  // }

  // Future<void> _onEditComment(
  //     EditCommentEvent event, Emitter<HomeState> emit) async {
  //   emit(PostLoading());
  //   final result = await useCases.editComment(event.comment);
  //   result.fold(
  //     (failure) => emit(PostError(failure.message)),
  //     (_) => emit(PostActionSuccess()),
  //   );
  // }

  // Future<void> _onDeleteComment(
  //     DeleteCommentEvent event, Emitter<HomeState> emit) async {
  //   emit(PostLoading());
  //   final result = await useCases.deleteComment(event.id);
  //   result.fold(
  //     (failure) => emit(PostError(failure.message)),
  //     (_) => emit(PostActionSuccess()),
  //   );
  // }
}
