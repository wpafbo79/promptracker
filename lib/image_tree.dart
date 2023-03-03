import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

import 'image_metadata.dart';
import 'image_tile.dart';

class ImageTree extends StatelessWidget {
  final String _imageDir;

  const ImageTree(this._imageDir, {super.key});

  @override
  Widget build(BuildContext context) {
    Directory directory = Directory(_imageDir);
    List<FileSystemEntity> files = directory
        .listSync()
        .where((file) => file.path.endsWith(".png"))
        .toList();

    files
        .sort((a, b) => b.statSync().modified.compareTo(a.statSync().modified));

    List<ImageMetadata> metadata = [];

    for (var file in files) {
      String metadataFile =
          "${file.parent.path}/${file.path.split('/').last.split('.').first}.yaml";
      File metadataContent = File(metadataFile);
      if (metadataContent.existsSync()) {
        String fileMetadata = metadataContent.readAsStringSync();
        var yaml = loadYaml(fileMetadata);
        metadata.add(ImageMetadata(
          imagePath: file.path,
          metadataPath: metadataFile,
          prompt: yaml["prompt"] ?? "",
          model: yaml["model"] ?? "",
          steps: yaml["steps"] ?? 0,
          seed: yaml["seed"] ?? 0,
          sourceImage: yaml["source"] ?? "",
          strength: yaml["strength"] ?? 0.0,
        ));
      } else {
        metadata.add(ImageMetadata(
          imagePath: file.path,
          metadataPath: "",
          prompt: "No metadata available",
          model: "",
          steps: 0,
          seed: 0,
        ));
      }
    }

    Map<String, List<ImageMetadata>> imageMap = {};

    for (var meta in metadata) {
      if (meta.sourceImage.isEmpty) {
        imageMap.putIfAbsent(meta.imagePath, () => []);
        imageMap[meta.imagePath]?.add(meta);
      } else {
        imageMap.putIfAbsent(meta.sourceImage, () => []);
        imageMap[meta.sourceImage]?.add(meta);
      }
    }

    return ListView.builder(
      itemCount: imageMap.keys.length,
      itemBuilder: (BuildContext context, int index) {
        String imagePath = imageMap.keys.elementAt(index);
        List<ImageMetadata> metadatas = imageMap[imagePath] ?? [];
        if (metadatas.isEmpty) {
          return const SizedBox.shrink();
        }
        if (metadatas.length == 1) {
          return ImageTile(metadata: metadatas[0]);
        }
        List<ImageTile> children = [];
        for (var metadata in metadatas) {
          children.add(ImageTile(metadata: metadata));
        }
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageTile(metadata: metadatas[0], isParent: true),
              Container(
                margin: const EdgeInsets.only(left: 30.0),
                child: Column(children: children),
              ),
            ],
          ),
        );
      },
    );
  }
}
