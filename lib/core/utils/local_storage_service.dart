import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool getSeenOnboarding() {
    return _prefs?.getBool('seenOnboarding') ?? false;
  }

  static Future setSeenOnboarding() async {
    await _prefs?.setBool('seenOnboarding', true);
  }
}
