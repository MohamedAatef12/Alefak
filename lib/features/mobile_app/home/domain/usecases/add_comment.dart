import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/comments_entity.dart';
import '../repos/home_domain_repo.dart';

@injectable
class AddCommentUseCase {
  final HomeDomainRepository repository;

  AddCommentUseCase(this.repository);

  Future<Either<Failure, void>> call(CommentEntity comment) {
    return repository.addComment(comment);
  }
}
