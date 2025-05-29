import 'package:alefk/features/home/domain/entities/comments_entity.dart';
import 'package:alefk/features/home/domain/entities/post_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class PostLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class PostsLoaded extends HomeState {
  final List<PostEntity> posts;
  PostsLoaded(this.posts);

  @override
  List<Object?> get props => [posts];
}

class PostActionSuccess extends HomeState {
  @override
  List<Object?> get props => [];
}

class PostError extends HomeState {
  final String message;
  PostError(this.message);
  @override
  List<Object?> get props => [message];
}

class AddPostInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class AddPostLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class AddPostSuccess extends HomeState {
  final PostEntity post;
  AddPostSuccess(this.post);
  @override
  List<Object?> get props => [post];
}

class AddPostError extends HomeState {
  final String message;
  AddPostError(this.message);
  @override
  List<Object?> get props => [message];
}

class CommentsLoaded extends HomeState {
  final List<CommentEntity> comments;
  CommentsLoaded(this.comments);

  @override
  List<Object?> get props => [comments];
}
