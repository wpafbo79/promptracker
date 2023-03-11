import 'package:flutter/material.dart';

import 'package:promptracker/home_screen.dart';

void main() {
  runApp(const PrompTrackerApp());
}

class PrompTrackerApp extends StatelessWidget {
  const PrompTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PrompTracker',
      home: HomeScreen(),
    );
  }
}
