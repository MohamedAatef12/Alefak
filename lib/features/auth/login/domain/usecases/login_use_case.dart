import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/login/domain/entity/login_entity.dart';
import 'package:alefk/features/auth/login/domain/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final LoginDomainRepository repository;
  LoginUseCase(this.repository);

  Future<Either<Failure,void>> call(LoginEntity entity) async {
    return await repository.login(entity);
  }
}