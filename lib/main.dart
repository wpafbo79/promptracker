import 'package:flutter/material.dart';

import 'package:promptracker/app_config.dart';
import 'package:promptracker/home_screen.dart';
import 'package:promptracker/image_directory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = await AppConfig.load();
  runApp(PrompTrackerApp(config: config));
}

class PrompTrackerApp extends StatelessWidget {
  final AppConfig config;

  const PrompTrackerApp({Key? key, required this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrompTracker',
      home: HomeScreen(imageDirectory: ImageDirectory(config.imageDirectory)),
    );
  }
}
