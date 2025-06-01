import 'package:alefk/features/auth/login/domain/entity/login_entity.dart';
import 'package:alefk/features/auth/login/domain/repos/login_local_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginLocalUseCase {
  final LoginLocalRepository repository;
  LoginLocalUseCase(this.repository);

  Future<void> saveLogin(LoginEntity entity, bool rememberMe) =>
      repository.saveLogin(entity, rememberMe);

  Future<bool> isRemembered() => repository.isRemembered();

  Future<LoginEntity?> getSavedLogin() => repository.getSavedLogin();

  Future<void> clearLogin() => repository.clearLogin();
}