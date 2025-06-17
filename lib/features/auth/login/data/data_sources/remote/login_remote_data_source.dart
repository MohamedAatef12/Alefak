import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/login/data/models/login_model.dart';
import 'package:alefk/features/auth/login/domain/entity/login_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure,LoginResponseEntity>> login(LoginModel model);
}