import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/register/domain/entities/register_domain_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterDomainRepository {
  Future<Either<Failure,void>> register(RegisterEntity model);
}