import 'dart:convert';
import 'dart:io';

class AppConfig {
  final String imageDirectory;

  AppConfig({required this.imageDirectory});

  static Future<AppConfig> load() async {
    final configFile = File('config.json');
    if (!configFile.existsSync()) {
      throw Exception('Configuration file not found.');
    }
    final contents = await configFile.readAsString();
    final json = jsonDecode(contents);
    final imageDirectory = json['imageDirectory'];
    final normalizedImageDirectory = imageDirectory.replaceAll(
        '\\', '/'); // replace Windows-style backslashes with forward slashes
    return AppConfig(imageDirectory: normalizedImageDirectory);
  }
}
