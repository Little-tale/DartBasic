import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  late SharedPreferences _preferences;

  AppSharedPreference._();

  static final AppSharedPreference instance = AppSharedPreference._();

  static init() async {
    instance._preferences = await SharedPreferences.getInstance();
  }

  setCount(int count) {
    _preferences.setInt('count', count);
  }

  int getCount() {
    return _preferences.getInt('count') ?? 0;
  }
}
