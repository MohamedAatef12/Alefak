import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/register_domain_entity.dart';
import '../repos/register_domain_repo.dart';

@injectable
class RegisterUseCase {
  final RegisterDomainRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, void>> call(RegisterEntity entity) async {
    return await repository.register(entity);
  }
}
