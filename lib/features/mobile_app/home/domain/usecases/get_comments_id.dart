import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/comments_entity.dart';
import '../repos/home_domain_repo.dart';

@injectable
class GetPostCommentsUseCase {
  final HomeDomainRepository repository;

  GetPostCommentsUseCase(this.repository);

  Future<Either<Failure, List<CommentEntity>>> call(int postId) {
    return repository.getPostComments(postId);
  }
}
