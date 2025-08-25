import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/register_domain_entity.dart';

abstract class RegisterDomainRepository {
  Future<Either<Failure, void>> register(RegisterEntity model);
}
