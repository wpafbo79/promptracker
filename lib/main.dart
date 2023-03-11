import 'package:flutter/material.dart';

import 'package:promptracker/home_screen.dart';
import 'package:promptracker/image_directory.dart';

void main() {
  runApp(const PrompTrackerApp());
}

class PrompTrackerApp extends StatelessWidget {
  const PrompTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrompTracker',
      home: HomeScreen(imageDirectory: ImageDirectory()),
    );
  }
}
