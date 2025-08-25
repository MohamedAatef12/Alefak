import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entity/login_response_entity.dart';
import '../../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, LoginResponseEntity>> login(LoginModel model);
}
