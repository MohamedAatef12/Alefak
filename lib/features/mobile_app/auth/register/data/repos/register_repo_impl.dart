import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/register_domain_entity.dart';
import '../../domain/repos/register_domain_repo.dart';
import '../models/register_model.dart';
import '../source/register_remote_data_source.dart';

@Injectable(as: RegisterDomainRepository)
class RegisterRepositoryImpl implements RegisterDomainRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> register(RegisterEntity model) async {
    final registerModel = RegisterModel.fromEntity(model);
    return await remoteDataSource.register(registerModel);
  }
}
