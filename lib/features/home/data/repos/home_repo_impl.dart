import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/home/data/models/comments_model.dart';
import 'package:alefk/features/home/data/models/likes_model.dart';
import 'package:alefk/features/home/data/models/post_model.dart';
import 'package:alefk/features/home/data/sources/remote/home_remote_data_source.dart';
import 'package:alefk/features/home/domain/entities/comments_entity.dart';
import 'package:alefk/features/home/domain/entities/likes_entity.dart';
import 'package:alefk/features/home/domain/entities/post_entity.dart';
import 'package:alefk/features/home/domain/repos/home_domain_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDomainRepository)
class HomeRepositoryImpl implements HomeDomainRepository {
  final RemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  /// Posts

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    final result = await remoteDataSource.getPosts();

    return result.fold(
      (failure) => Left(failure),
      (models) => Right(models
          .map((model) => model.toEntity(
                PostModel(
                  id: model.id,
                  text: model.text,
                  username: model.username,
                  date: model.date,
                  authorID: model.authorID,
                  imageUrl: model.imageUrl,
                  author: model.author,
                ),
              ))
          .toList()),
    );
  }

  @override
  Future<Either<Failure, PostEntity>> getPostDetails(int id) async {
    final result = await remoteDataSource.getPostDetails(id);

    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity(
        PostModel(
            id: model.id,
            text: model.text,
            username: model.username,
            date: model.date,
            authorID: model.authorID,
            imageUrl: model.imageUrl,
            author: model.author),
      )),
    );
  }

  @override
  Future<Either<Failure, void>> addPost(PostEntity post) async {
    final postModel = PostModel.fromEntity(post);
    return remoteDataSource.addPost(postModel);
  }

  @override
  Future<Either<Failure, void>> deletePost(int id) async {
    return remoteDataSource.deletePost(id);
  }

  @override
  Future<Either<Failure, void>> editPost(PostEntity post) async {
    final postModel = PostModel.fromEntity(post);
    return remoteDataSource.editPost(postModel);
  }

  /// Comments

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments() async {
    final result = await remoteDataSource.getComments();

    return result.fold(
      (failure) => Left(failure),
      (models) => Right(models
          .map((model) => model.toEntity(
                CommentModel(
                  id: model.id,
                  text: model.text,
                  postID: model.postID,
                  userID: model.userID,
                  date: model.date,
                ),
              ))
          .toList()),
    );
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> getPostComments(
      int postId) async {
    final result = await remoteDataSource.getPostComments(postId);

    return result.fold(
      (failure) => Left(failure),
      (models) => Right(models
          .map((model) => model.toEntity(
                CommentModel(
                  id: model.id,
                  text: model.text,
                  postID: model.postID,
                  userID: model.userID,
                  date: model.date,
                ),
              ))
          .toList()),
    );
  }

  @override
  Future<Either<Failure, int>> getCommentCounts(int postId) async {
    final result = await remoteDataSource.getCommentCounts(postId);

    return result.fold(
      (failure) => Left(failure),
      (count) => Right(count),
    );
  }

  @override
  Future<Either<Failure, void>> addComment(CommentEntity comment) async {
    final commentModel = CommentModel.fromEntity(comment);
    return remoteDataSource.addComment(commentModel);
  }

  @override
  Future<Either<Failure, void>> deleteComment(int id) async {
    return remoteDataSource.deleteComment(id);
  }

  @override
  Future<Either<Failure, void>> editComment(CommentEntity comment) async {
    final commentModel = CommentModel.fromEntity(comment);
    return remoteDataSource.editComment(commentModel);
  }

  /// Likes

  @override
  Future<Either<Failure, List<LikesEntity>>> getPostLikes(int postId) async {
    final result = await remoteDataSource.getPostLikes(postId);

    return result.fold(
      (failure) => Left(failure),
      (likes) => Right(likes
          .map((like) => like.toEntity(
                LikesModel(
                  id: like.id,
                  postID: like.postID,
                  userID: like.userID,
                  date: like.date,
                ),
              ))
          .toList()),
    );
  }

  @override
  Future<Either<Failure, int>> getLikeCounts(int postId) async {
    final result = await remoteDataSource.getLikeCounts(postId);

    return result.fold(
      (failure) => Left(failure),
      (count) => Right(count),
    );
  }

  @override
  Future<Either<Failure, void>> likePost(int postId) async {
    // Implement the method to like a post
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> unlikePost(int postId) async {
    // Implement the method to unlike a post
    throw UnimplementedError();
  }
}
