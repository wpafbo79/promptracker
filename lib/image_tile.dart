import 'dart:io';

import 'package:flutter/material.dart';

import 'image_metadata.dart';

class ImageTile extends StatelessWidget {
  final ImageMetadata metadata;
  final bool isParent;

  const ImageTile({super.key, required this.metadata, this.isParent = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (metadata.metadataPath.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageMetadataView(metadata: metadata)),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isParent
                ? Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: const Icon(Icons.arrow_right),
                  )
                : Container(width: 20.0),
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: Image.file(File(metadata.imagePath), width: 100.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    metadata.prompt,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    metadata.model,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  Text(
                    "Steps: ${metadata.steps}, Seed: ${metadata.seed}",
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  if (metadata.sourceImage.isNotEmpty)
                    Text(
                      "Source: ${metadata.sourceImage}, Strength: ${metadata.strength}",
                      style: const TextStyle(fontSize: 14.0),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageMetadataView extends StatelessWidget {
  final ImageMetadata metadata;

  const ImageMetadataView({super.key, required this.metadata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(metadata.prompt)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Model: ${metadata.model}",
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              "Prompt: ${metadata.prompt}",
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              "Steps: ${metadata.steps}, Seed: ${metadata.seed}",
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            if (metadata.sourceImage.isNotEmpty)
              Text(
                "Source: ${metadata.sourceImage}, Strength: ${metadata.strength}",
                style: const TextStyle(fontSize: 16.0),
              ),
            const SizedBox(height: 10.0),
            Text(
              "Metadata Path: ${metadata.metadataPath}",
              style: const TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
