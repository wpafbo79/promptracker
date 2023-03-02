import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String imageDir = "images";
  final String metadataDir = "metadata";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Directory directory = Directory(imageDir);
    List<FileSystemEntity> files = directory
        .listSync()
        .where((file) => file.path.endsWith(".png"))
        .toList();

    files
        .sort((a, b) => b.statSync().modified.compareTo(a.statSync().modified));

    List<String> metadata = [];

    for (var file in files) {
      String fileName = file.path.split("/").last;
      String metadataFile = "$metadataDir/$fileName.txt";
      File metadataContent = File(metadataFile);
      if (metadataContent.existsSync()) {
        String fileMetadata = metadataContent.readAsStringSync();
        metadata.add(fileMetadata);
      } else {
        metadata.add("No metadata available");
      }
    }

    return MaterialApp(
      title: 'PrompTracker',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Local Images')),
        body: GridView.builder(
          itemCount: files.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Expanded(child: Image.file(files[index] as File)),
                Text(metadata[index]),
              ],
            );
          },
        ),
      ),
    );
  }
}
