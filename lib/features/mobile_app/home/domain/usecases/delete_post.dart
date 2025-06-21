import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repos/home_domain_repo.dart';

@injectable
class DeletePostUseCase {
  final HomeDomainRepository repository;

  DeletePostUseCase(this.repository);

  Future<Either<Failure, void>> call(int id) {
    return repository.deletePost(id);
  }
}
