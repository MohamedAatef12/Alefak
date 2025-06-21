import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repos/home_domain_repo.dart';

@injectable
class GetLikesCountUseCase {
  final HomeDomainRepository repository;

  GetLikesCountUseCase(this.repository);

  Future<Either<Failure, int>> call(int postId) {
    return repository.getLikeCounts(postId);
  }
}
