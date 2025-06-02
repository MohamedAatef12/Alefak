import 'package:alefk/features/auth/register/data/models/register_model.dart';


abstract class ICacheManager {
  Future<void> init();
  Future<void> saveUserData(RegisterModel user);
  bool? logout();
  Future<void> setCrossOnBoardingPage();
  bool isCrossedOnBoardingPage();
  RegisterModel? getUserData();
  saveLogin( bool rememberMe);
  isRemembered();
  getSavedLogin();
  clearLogin();
}
