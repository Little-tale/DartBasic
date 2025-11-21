// ignore_for_file: unused_field

import 'package:shared_preferences/shared_preferences.dart';

enum AppPreferences2Keys {
  userName,
  userAge,
}

abstract class AbstractAppPreferences2 {
  Future<bool> setValue<T>(PreferenceItem2<T> item, T? value);
  Future<bool> deleteValue<T>(PreferenceItem2<T> item);
  T getValue<T>(PreferenceItem2<T> item);
}

class PreferenceItem2<T> {
  final T defaultValue;
  final AppPreferences2Keys key;

  PreferenceItem2(this.key, this.defaultValue);

  void call(T value) {
    AppPreferences2.instance.setValue<T>(this, value);
  }

  Future<bool> set(T value) {
    return AppPreferences2.instance.setValue<T>(this, value);
  }

  T get() {
    return AppPreferences2.instance.getValue<T>(this);
  }

  Future<bool> delete() {
    return AppPreferences2.instance.deleteValue<T>(this);
  }
}

class AppPreferences2 implements AbstractAppPreferences2 {
  AppPreferences2._();

  static final AppPreferences2 instance = AppPreferences2._();
  final String prefix = 'AppPreference2.';
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool _isNullable<T>() => null is T;

  @override
  T getValue<T>(PreferenceItem2<T> item) {
    final key = getPrefKey(item);
    switch (T) {
      case int:
        return _prefs.getInt(key) as T? ?? item.defaultValue;
      case String:
        return _prefs.getString(key) as T? ?? item.defaultValue;
      case double:
        return _prefs.getDouble(key) as T? ?? item.defaultValue;
      case bool:
        return _prefs.getBool(key) as T? ?? item.defaultValue;
      case const (List<String>):
        return _prefs.getStringList(key) as T? ?? item.defaultValue;
      default:
        return transform(T, _prefs.getString(key)) ?? item.defaultValue;
    }
  }

  @override
  Future<bool> setValue<T>(PreferenceItem2<T> item, T? value) {
    final String key = getPrefKey(item);
    final isNullable = _isNullable<T>();

    if (isNullable && value == null) {
      //null을 세팅한다는 것은 값을 지운다는 의미로 해석. 필요에 따라 변경해서 쓰시면 되요.
      return _prefs.remove(key);
    }

    if (isNullable) {
      switch (T.toString()) {
        case "int?":
          return _prefs.setInt(key, value as int);
        case "String?":
          return _prefs.setString(key, value as String);
        case "double?":
          return _prefs.setDouble(key, value as double);
        case "bool?":
          return _prefs.setBool(key, value as bool);
        case "List<String>?":
          return _prefs.setStringList(key, value as List<String>);
        case "DateTime?":
          return _prefs.setString(key, (value as DateTime).toIso8601String());
        default:
          if (value is Enum) {
            return _prefs.setString(key, value.name);
          } else {
            throw Exception('$T 타입에 대한 저장 transform 함수를 추가 해주세요.');
          }
      }
    } else {
      switch (T) {
        case int:
          return _prefs.setInt(key, value as int);
        case String:
          return _prefs.setString(key, value as String);
        case double:
          return _prefs.setDouble(key, value as double);
        case bool:
          return _prefs.setBool(key, value as bool);
        case const (List<String>):
          return _prefs.setStringList(key, value as List<String>);
        case DateTime:
          return _prefs.setString(key, (value as DateTime).toIso8601String());
        default:
          if (value is Enum) {
            return _prefs.setString(key, value.name);
          } else {
            throw Exception('$T 타입에 대한 저장 transform 함수를 추가 해주세요.');
          }
      }
    }
  }

  @override
  Future<bool> deleteValue<T>(PreferenceItem2<T> item) {
    final String key = getPrefKey(item);
    return _prefs.remove(key);
  }

  String getPrefKey(PreferenceItem2 item) {
    return '$prefix${item.key.name}';
  }
}

extension AppPreferences2Extension on AppPreferences2 {
  T? transform<T>(Type t, String? value) {
    if (value == null) {
      return null;
    }
    bool isNullableType = _isNullable<T>();

    if (isNullableType) {
      switch (t.toString()) {
        case "DateTime?":
          return DateTime.parse(value) as T?;
        default:
          throw Exception('$t 타입에 대한 transform 함수를 추가 해주세요.');
      }
    } else {
      switch (t) {
        case DateTime:
          return DateTime.parse(value) as T?;
        default:
          throw Exception('$t 타입에 대한 transform 함수를 추가 해주세요.');
      }
    }
  }
}
