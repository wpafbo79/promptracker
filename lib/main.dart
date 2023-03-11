import 'package:flutter/material.dart';

void main() {
  runApp(const PrompTrackerApp());
}

class PrompTrackerApp extends StatelessWidget {
  const PrompTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrompTracker',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PrompTracker'),
        ),
        body: const Center(
          child: Text('Welcome to PrompTracker!'),
        ),
      ),
    );
  }
}
