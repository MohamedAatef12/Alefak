import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/mobile_app/auth/register/domain/entities/register_domain_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/comments_entity.dart';
import '../entities/likes_entity.dart';
import '../entities/post_entity.dart';

abstract class HomeDomainRepository {
  // Posts
  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, void>> addPost(PostEntity post);
  Future<Either<Failure, void>> deletePost(int id);
  Future<Either<Failure, void>> editPost(PostEntity post);

  // Comments
  Future<Either<Failure, List<CommentEntity>>> getPostComments(int id);
  Future<Either<Failure, void>> addComment(CommentEntity comment);
  Future<Either<Failure, void>> deleteComment(int id);
  Future<Either<Failure, void>> editComment(CommentEntity comment);

  // Likes
  Future<Either<Failure, List<LikesEntity>>> getPostLikes(int postId);
  Future<Either<Failure, LikesEntity>> likePost(int postId, int id);
  Future<Either<Failure, void>> unlikePost(int postId);

  // Cached Data
  Future<Either<Failure, RegisterEntity>> getCachedUserData();
}
