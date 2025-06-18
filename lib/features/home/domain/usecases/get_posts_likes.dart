import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/home/domain/entities/likes_entity.dart';
import 'package:alefk/features/home/domain/repos/home_domain_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPostLikesUseCase {
  final HomeDomainRepository repository;

  GetPostLikesUseCase(this.repository);

  Future<Either<Failure, List<LikesEntity>>> call(int postId) {
    return repository.getPostLikes(postId);
  }
}
