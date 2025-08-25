import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/likes_entity.dart';
import '../repos/home_domain_repo.dart';

@injectable
class GetPostLikesUseCase {
  final HomeDomainRepository repository;

  GetPostLikesUseCase(this.repository);

  Future<Either<Failure, List<LikesEntity>>> call(int postId) {
    return repository.getPostLikes(postId);
  }
}
