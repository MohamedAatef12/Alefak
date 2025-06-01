import 'package:alefk/features/auth/login/data/data_sources/local/login_local_data_source.dart';
import 'package:alefk/features/auth/login/domain/entity/login_entity.dart';
import 'package:alefk/features/auth/login/domain/repos/login_local_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginLocalRepository)
class LoginLocalRepositoryImpl implements LoginLocalRepository {
  final LoginLocalDataSource localDataSource;
  LoginLocalRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveLogin(LoginEntity entity, bool rememberMe) async {
    await localDataSource.saveLogin(entity.email, entity.password, rememberMe);
  }

  @override
  Future<bool> isRemembered() => localDataSource.isRemembered();

  @override
  Future<LoginEntity?> getSavedLogin() async {
    final email = await localDataSource.getEmail();
    final password = await localDataSource.getPassword();
    if (email != null && password != null) {
      return LoginEntity(email: email, password: password);
    }
    return null;
  }

  @override
  Future<void> clearLogin() => localDataSource.clearLogin();
}