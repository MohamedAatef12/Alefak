import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/post_entity.dart';
import '../repos/home_domain_repo.dart';

@injectable
class AddPostUseCase {
  final HomeDomainRepository repository;

  AddPostUseCase(this.repository);

  Future<Either<Failure, void>> call(PostEntity post) {
    return repository.addPost(post);
  }
}
