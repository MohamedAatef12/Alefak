import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/login/domain/entity/login_entity.dart';
import 'package:alefk/features/auth/login/domain/entity/login_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginDomainRepository {
  Future<Either<Failure,LoginResponseEntity>> login(LoginEntity model);
}