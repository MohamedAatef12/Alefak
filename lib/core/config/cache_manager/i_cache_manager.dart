import 'package:alefk/features/auth/register/data/models/register_model.dart';


abstract class ICacheManager {
  Future<void> init();
  Future<void> setUserData(RegisterModel data);
  bool? logout();
  Future<void> setCrossOnBoardingPage();
  bool isCrossedOnBoardingPage();
  RegisterModel? getUserData();
  saveLogin( bool rememberMe);
  isRemembered();
  getSavedLogin();
  clearLogin();
  Future<void> setThemeDark(bool isDark);
  Future<bool> isThemeDark();
  Future<void> writeSecureData(String key, String value);
  Future<String?> readSecureData(String key);
  Future<void> deleteSecureData(String key);
}
