import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/login_entity.dart';
import '../../domain/entity/login_response_entity.dart';
import '../../domain/repos/login_repo.dart';
import '../data_sources/remote/login_remote_data_source.dart';
import '../models/login_model.dart';

@Injectable(as: LoginDomainRepository)
class LoginRepositoryImpl implements LoginDomainRepository {
  final LoginRemoteDataSource remoteDataSource;
  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, LoginResponseEntity>> login(LoginEntity model) async {
    final loginModel = LoginModel.fromEntity(model);
    return await remoteDataSource.login(loginModel);
  }
}
