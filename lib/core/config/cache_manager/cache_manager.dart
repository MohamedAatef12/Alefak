import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'i_cache_manager.dart';

class CacheManager implements ICacheManager {
  SharedPreferences? _prefs;

  CacheManager();

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setUserData(dynamic value) async {
    String jsonString = json.encode(value);

    await _prefs?.setString('user', jsonString);
  }

  @override
  bool? logout() {
    _prefs?.remove('user');
    return true;
  }

  @override
  bool isCrossedOnBoardingPage() {
    return _prefs?.containsKey("OnBoardingPage") ?? false;
  }

  @override
  Future<void> setCrossOnBoardingPage() async {
    await _prefs?.setString('OnBoardingPage', "true");
  }
}
