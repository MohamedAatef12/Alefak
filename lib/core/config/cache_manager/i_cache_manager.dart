abstract class ICacheManager {
  Future<void> init();

  Future<void> setUserData(dynamic data);

  bool? logout();

  Future<void> setCrossOnBoardingPage();

  bool isCrossedOnBoardingPage();
}
