import 'dart:io';

class ImageDirectory {
  static const imageExtensions = ['jpg', 'jpeg', 'png'];

  Future<List<File>> getImages() async {
    final directory = Directory('/path/to/user/directory');
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
