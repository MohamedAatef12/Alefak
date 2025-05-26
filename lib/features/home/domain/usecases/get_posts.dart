import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/home/domain/entities/post_entity.dart';
import 'package:alefk/features/home/domain/repos/home_domain_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPostsUseCase {
  final HomeDomainRepository repository;

  GetPostsUseCase(this.repository);

  Future<Either<Failure, List<PostEntity>>> call() {
    return repository.getPosts();
  }
}
