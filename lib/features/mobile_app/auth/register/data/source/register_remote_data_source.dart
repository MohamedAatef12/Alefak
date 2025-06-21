import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';

import '../models/register_model.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<Failure, void>> register(RegisterModel model);
}
