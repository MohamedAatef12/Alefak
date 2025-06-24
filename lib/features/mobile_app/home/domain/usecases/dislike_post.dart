import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repos/home_domain_repo.dart';

@injectable
class UnLikePostUseCase {
  final HomeDomainRepository repository;

  UnLikePostUseCase(this.repository);

  Future<Either<Failure, void>> call(
    int postId,
  ) {
    return repository.unlikePost(
      postId,
    );
  }
}
