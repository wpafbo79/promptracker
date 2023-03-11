import 'dart:io';

class ImageDirectory {
  final String directoryPath;
  static const imageExtensions = ['jpg', 'jpeg', 'png'];

  ImageDirectory(this.directoryPath);

  Future<List<File>> getImages() async {
    final directory = Directory(directoryPath);
    final files = await directory.list().toList();
    final imageFiles = files
        .where((file) =>
            file is File && imageExtensions.contains(file.path.split('.').last))
        .map((file) => file as File)
        .toList();
    imageFiles
        .sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));
    return imageFiles;
  }
}
