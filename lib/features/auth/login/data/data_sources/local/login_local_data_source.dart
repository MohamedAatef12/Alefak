abstract class LoginLocalDataSource {
  Future<void> saveLogin(String email, String password, bool rememberMe);
  Future<bool> isRemembered();
  Future<String?> getEmail();
  Future<String?> getPassword();
  Future<void> clearLogin();
}