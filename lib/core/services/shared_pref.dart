import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> toggleAppTheme() async {
    if (prefs == null) {
      await init();
    }
    bool isDark = prefs!.getBool('dark') ?? true;
    await prefs!.setBool('dark', !isDark);
  }

  // Add language methods
  String getLanguage() {
    return prefs!.getString('language') ?? 'en';
  }

  Future<void> setLanguage(String languageCode) async {
    if (prefs == null) {
      await init();
    }
    await prefs!.setString('language', languageCode);
  }
}
