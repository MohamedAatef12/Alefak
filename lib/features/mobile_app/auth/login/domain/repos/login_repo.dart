import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';

import '../entity/login_entity.dart';
import '../entity/login_response_entity.dart';

abstract class LoginDomainRepository {
  Future<Either<Failure, LoginResponseEntity>> login(LoginEntity model);
}
