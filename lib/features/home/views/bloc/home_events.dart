import 'package:alefk/features/home/domain/entities/comments_entity.dart';
import 'package:alefk/features/home/domain/entities/post_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPostsEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class AddPostEvent extends HomeEvent {
  final PostEntity post;
  AddPostEvent(this.post);

  @override
  List<Object?> get props => [post];
}

class DeletePostEvent extends HomeEvent {
  final int id;
  DeletePostEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class EditPostEvent extends HomeEvent {
  final PostEntity post;
  EditPostEvent(this.post);

  @override
  List<Object?> get props => [post];
}

class FetchCommentsEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class AddCommentEvent extends HomeEvent {
  final CommentEntity comment;
  AddCommentEvent(this.comment);

  @override
  List<Object?> get props => [comment];
}

class EditCommentEvent extends HomeEvent {
  final CommentEntity comment;
  EditCommentEvent(this.comment);

  @override
  List<Object?> get props => [comment];
}

class DeleteCommentEvent extends HomeEvent {
  final int id;
  DeleteCommentEvent(this.id);
}
