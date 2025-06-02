import 'dart:developer';

import 'package:alefk/core/config/api/api_services.dart';
import 'package:alefk/core/config/api/constants.dart';
import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/home/data/models/comments_model.dart';
import 'package:alefk/features/home/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'home_remote_data_source.dart';

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService apiService;

  RemoteDataSourceImpl(this.apiService);

  // Posts

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      final data = await apiService.getList(
        endPoint: Constants.postsEndpoint,
      );

      final posts = data.map((e) => PostModel.fromJson(e)).toList();

      // Sort posts by date descending (latest first)
      posts.sort(
          (a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));

      return Right(posts);
    } catch (e) {
      log('Error fetching posts: $e');
      return Left(DioFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> editPost(PostModel post) async {
    try {
      await apiService.put(
        endPoint: '${Constants.postsEndpoint}/${post.id}',
        data: post.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> addPost(PostModel post) async {
    try {
      log('Adding post: ${post.toJson()}');
      await apiService.post(
        endPoint: Constants.postsEndpoint,
        data: post.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      return const Right(null);
    } catch (e) {
      log('Error adding post: $e');
      return Left(DioFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, PostModel>> getPostDetails(int id) async {
    try {
      final data =
          await apiService.get(endPoint: '${Constants.postsEndpoint}/$id');
      return Right(PostModel.fromJson(data));
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> deletePost(int id) async {
    try {
      await apiService.delete(endPoint: '${Constants.postsEndpoint}/$id');
      return const Right(null);
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }

  // Comments

  @override
  Future<Either<Failure, List<CommentModel>>> getComments() async {
    try {
      final data =
          await apiService.getList(endPoint: Constants.commentsEndpoint);
      final comments = data.map((e) => CommentModel.fromJson(e)).toList();
      return Right(comments);
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> getPostComments(
      int postId) async {
    try {
      final data = await apiService.getList(
        endPoint: '${Constants.commentsEndpoint}/PostComments/15055',
      );

      final comments = data.map((e) => CommentModel.fromJson(e)).toList();

      return Right(comments);
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> addComment(CommentModel comment) async {
    try {
      await apiService.post(
        endPoint: Constants.commentsEndpoint,
        data: comment.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteComment(int id) async {
    try {
      await apiService.delete(endPoint: '${Constants.commentsEndpoint}/$id');
      return const Right(null);
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> editComment(CommentModel comment) async {
    try {
      await apiService.put(
        endPoint: '${Constants.commentsEndpoint}/${comment.id}',
        data: comment.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }
}
