import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  Future<T?> retrieveData<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (T == bool) {
    final value = prefs.getBool(key);
    logInfo("LocalPreferences retrieveData<bool> for key $key returned: $value");
    return value as T?;
  } else if (T == double) {
    final value = prefs.getDouble(key);
    logInfo("LocalPreferences retrieveData<double> for key $key returned: $value");
    return value as T?;
  } else if (T == int) {
    final value = prefs.getInt(key);
    logInfo("LocalPreferences retrieveData<int> for key $key returned: $value");
    return value as T?;
  } else if (T == String) {
    final value = prefs.getString(key);
    logInfo("LocalPreferences retrieveData<String> for key $key returned: $value");
    return value as T?;
  } else if (T == List<String>) {
    final value = prefs.getStringList(key);
    logInfo("LocalPreferences retrieveData<List<String>> for key $key returned: $value");
    return value as T?;
  } else {
    logInfo("LocalPreferences retrieveData: Unsupported type for key $key");
    throw Exception("Unsupported type");
  }
    
  }

  Future<void> storeData(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = false;

    if (value is bool) {
      result = await prefs.setBool(key, value);
      logInfo("LocalPreferences setBool with key $key and value $value got $result");
    } else if (value is double) {
      result = await prefs.setDouble(key, value);
      logInfo("LocalPreferences setDouble with key $key and value $value got $result");
    } else if (value is int) {
      result = await prefs.setInt(key, value);
      logInfo("LocalPreferences setInt with key $key and value $value got $result");
    } else if (value is String) {
      result = await prefs.setString(key, value);
      logInfo("LocalPreferences setString with key $key and value $value got $result");
    } else if (value is List<String>) {
      result = await prefs.setStringList(key, value);
      logInfo("LocalPreferences setStringList with key $key and value $value got $result");
    } else {
      throw Exception("Unsupported type");
    }

    if (!result) {
      logInfo("Failed to store $key with value $value");
    }
  }
}
