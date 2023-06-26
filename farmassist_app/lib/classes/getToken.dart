import 'package:shared_preferences/shared_preferences.dart';

Future<String> getToken(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ??
      ""; // Returns an empty string if the key doesn't exist
}
