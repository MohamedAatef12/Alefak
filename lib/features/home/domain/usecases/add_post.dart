import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/home/domain/entities/post_entity.dart';
import 'package:alefk/features/home/domain/repos/home_domain_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddPostUseCase {
  final HomeDomainRepository repository;

  AddPostUseCase(this.repository);

  Future<Either<Failure, void>> call(PostEntity post) {
    return repository.addPost(post);
  }
}
