import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/home/data/models/comments_model.dart';
import 'package:alefk/features/home/data/models/likes_model.dart';
import 'package:alefk/features/home/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteDataSource {
  // Posts
  Future<Either<Failure, List<PostModel>>> getPosts();
  Future<Either<Failure, PostModel>> getPostDetails(int id);
  Future<Either<Failure, void>> addPost(PostModel post);
  Future<Either<Failure, void>> deletePost(int id);
  Future<Either<Failure, void>> editPost(PostModel post);

  // Comments
  Future<Either<Failure, List<CommentModel>>> getComments();
  Future<Either<Failure, List<CommentModel>>> getPostComments(int id);
  Future<Either<Failure, int>> getCommentCounts(int id);
  Future<Either<Failure, void>> addComment(CommentModel comment);
  Future<Either<Failure, void>> deleteComment(int id);
  Future<Either<Failure, void>> editComment(CommentModel comment);

  // Likes
  Future<Either<Failure, List<LikesModel>>> getPostLikes(int postId);
  Future<Either<Failure, int>> getLikeCounts(int postId);
  Future<Either<Failure, void>> likePost(int postId);
  Future<Either<Failure, void>> unlikePost(int postId);
}
