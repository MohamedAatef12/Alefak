import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repos/home_domain_repo.dart';

@injectable
class GetCommentsCountUseCase {
  final HomeDomainRepository repository;

  GetCommentsCountUseCase(this.repository);

  Future<Either<Failure, int>> call(int postId) {
    return repository.getCommentCounts(postId);
  }
}
