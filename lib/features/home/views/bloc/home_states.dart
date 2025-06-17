import 'package:alefk/features/home/domain/entities/comments_entity.dart';
import 'package:alefk/features/home/domain/entities/likes_entity.dart';
import 'package:alefk/features/home/domain/entities/post_entity.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final List<PostEntity> posts;
  final List<CommentEntity> comments;
  final List<LikesEntity> likes;
  final Map<int, int> likesCount;
  final Map<int, int> commentsCount;
  final bool isPostsLoading;
  final bool isCommentsLoading;
  final bool isLikesLoading;
  final bool isAddPostLoading;
  final bool isPostAdded;
  final String? error;

  const HomeState({
    this.posts = const [],
    this.comments = const [],
    this.likes = const [],
    this.likesCount = const {},
    this.commentsCount = const {},
    this.isPostsLoading = false,
    this.isCommentsLoading = false,
    this.isLikesLoading = false,
    this.isAddPostLoading = false,
    this.isPostAdded = false,
    this.error,
  });

  HomeState copyWith({
    List<PostEntity>? posts,
    List<CommentEntity>? comments,
    List<LikesEntity>? likes,
    Map<int, int>? likesCount,
    Map<int, int>? commentsCount,
    bool? isPostsLoading,
    bool? isCommentsLoading,
    bool? isLikesLoading,
    bool? isAddPostLoading,
    bool? isPostAdded,
    String? error,
  }) {
    return HomeState(
      posts: posts ?? this.posts,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      isLikesLoading: isLikesLoading ?? this.isLikesLoading,
      isPostsLoading: isPostsLoading ?? this.isPostsLoading,
      isCommentsLoading: isCommentsLoading ?? this.isCommentsLoading,
      isAddPostLoading: isAddPostLoading ?? this.isAddPostLoading,
      isPostAdded: isPostAdded ?? this.isPostAdded,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        posts,
        comments,
        likes,
        likesCount,
        commentsCount,
        isPostsLoading,
        isCommentsLoading,
        isLikesLoading,
        isAddPostLoading,
        isPostAdded,
        error,
      ];
}
