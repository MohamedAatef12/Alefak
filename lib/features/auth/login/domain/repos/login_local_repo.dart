import 'package:alefk/features/auth/login/domain/entity/login_entity.dart';

abstract class LoginLocalRepository {
  Future<void> saveLogin(LoginEntity entity, bool rememberMe);
  Future<bool> isRemembered();
  Future<LoginEntity?> getSavedLogin();
  Future<void> clearLogin();
}