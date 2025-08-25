import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repos/home_domain_repo.dart';

@injectable
class LikePostUseCase {
  final HomeDomainRepository repository;

  LikePostUseCase(this.repository);

  Future<Either<Failure, void>> call(int postId, int id) {
    print('[UseCase] Calling likePost for post $postId, user $id');

    return repository.likePost(postId, id);
  }
}
