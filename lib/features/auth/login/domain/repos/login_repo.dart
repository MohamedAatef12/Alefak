import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/login/domain/entity/login_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginDomainRepository {
  Future<Either<Failure,void>> login(LoginEntity model);
}