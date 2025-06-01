import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/register/data/models/register_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<Failure,void>> register(RegisterModel model);
}