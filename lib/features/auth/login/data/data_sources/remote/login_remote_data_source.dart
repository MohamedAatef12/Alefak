import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/login/data/models/login_model.dart';

import 'package:dartz/dartz.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure,void>> login(LoginModel model);
}