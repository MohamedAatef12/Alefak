import 'package:alefk/features/mobile_app/auth/register/domain/entities/register_domain_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/config/api/failure.dart';
import '../repos/home_domain_repo.dart';

@injectable
class GetUserDataUseCase {
  final HomeDomainRepository homeDomainRepository;

  GetUserDataUseCase(this.homeDomainRepository);
  Future<Either<Failure, RegisterEntity>> call() =>
      homeDomainRepository.getCachedUserData();
}
