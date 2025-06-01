import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:alefk/features/auth/login/data/models/login_model.dart';
import 'package:alefk/features/auth/login/domain/entity/login_entity.dart';
import 'package:alefk/features/auth/login/domain/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginDomainRepository)
class LoginRepositoryImpl implements LoginDomainRepository {
  final LoginRemoteDataSource remoteDataSource;
  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure,void>> login(LoginEntity model) async {
    final loginModel = LoginModel.fromEntity(model);
    return await remoteDataSource.login(loginModel);
  }
}