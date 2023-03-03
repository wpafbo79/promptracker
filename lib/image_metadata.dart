class ImageMetadata {
  final String imagePath;
  final String metadataPath;
  final String prompt;
  final String model;
  final int steps;
  final int seed;
  final String sourceImage;
  final double strength;

  ImageMetadata({
    required this.imagePath,
    required this.metadataPath,
    required this.prompt,
    required this.model,
    required this.steps,
    required this.seed,
    this.sourceImage = "",
    this.strength = 0.0,
  });
}
