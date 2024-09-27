import 'package:shared_preferences/shared_preferences.dart';

class PathManager {
  static const String _pathKey = 'selected_path';

  static Future<String> getPath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_pathKey) ?? '';
  }

  static Future<void> setPath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pathKey, path);
  }

  static Future<bool> isPathSet() async {
    final path = await getPath();
    return path.isNotEmpty;
  }
}
