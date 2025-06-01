import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/register/data/models/register_model.dart';
import 'package:alefk/features/auth/register/data/source/register_remote_data_source.dart';
import 'package:alefk/features/auth/register/domain/entities/register_domain_entity.dart';
import 'package:alefk/features/auth/register/domain/repos/register_domain_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterDomainRepository)
class RegisterRepositoryImpl implements RegisterDomainRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure,void>> register(RegisterEntity model) async {
   final registerModel = RegisterModel.fromEntity(model);
   return await remoteDataSource.register(registerModel);
  }
}