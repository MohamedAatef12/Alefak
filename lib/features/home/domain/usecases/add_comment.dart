import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/home/domain/entities/comments_entity.dart';
import 'package:alefk/features/home/domain/repos/home_domain_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCommentUseCase {
  final HomeDomainRepository repository;

  AddCommentUseCase(this.repository);

  Future<Either<Failure, void>> call(CommentEntity comment) {
    return repository.addComment(comment);
  }
}
