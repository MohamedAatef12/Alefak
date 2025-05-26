import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/home/domain/entities/comments_entity.dart';
import 'package:alefk/features/home/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeDomainRepository {
  // Posts
  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, PostEntity>> getPostDetails(int id);
  Future<Either<Failure, void>> addPost(PostEntity post);
  Future<Either<Failure, void>> deletePost(int id);
  Future<Either<Failure, void>> editPost(PostEntity post);

  // Comments
  Future<Either<Failure, List<CommentEntity>>> getComments();
  Future<Either<Failure, void>> addComment(CommentEntity comment);
  Future<Either<Failure, void>> deleteComment(int id);
  Future<Either<Failure, void>> editComment(CommentEntity comment);
}
