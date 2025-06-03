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
    bool isDark = prefs!.getBool('dark') ?? false;
    await prefs!.setBool('dark', !isDark);
  }
}
