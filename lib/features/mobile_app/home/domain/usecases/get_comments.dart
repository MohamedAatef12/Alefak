import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/comments_entity.dart';
import '../repos/home_domain_repo.dart';

@injectable
class GetCommentsUseCase {
  final HomeDomainRepository repository;

  GetCommentsUseCase(this.repository);

  Future<Either<Failure, List<CommentEntity>>> call() {
    return repository.getComments();
  }
}
