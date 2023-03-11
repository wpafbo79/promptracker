import 'dart:io';

import 'package:flutter/material.dart';

import 'package:promptracker/image_directory.dart';

class HomeScreen extends StatelessWidget {
  final ImageDirectory imageDirectory;

  const HomeScreen({Key? key, required this.imageDirectory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrompTracker'),
      ),
      body: FutureBuilder<List<File>>(
        future: imageDirectory.getImages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final imageFile = snapshot.data![index];
                return Image.file(imageFile);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
