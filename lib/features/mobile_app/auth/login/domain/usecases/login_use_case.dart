import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity/login_entity.dart';
import '../entity/login_response_entity.dart';
import '../repos/login_repo.dart';

@injectable
class LoginUseCase {
  final LoginDomainRepository repository;
  LoginUseCase(this.repository);

  Future<Either<Failure, LoginResponseEntity>> call(LoginEntity entity) async {
    return await repository.login(entity);
  }
}
