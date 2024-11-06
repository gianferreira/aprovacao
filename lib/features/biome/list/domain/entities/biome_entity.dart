class BiomeEntity {
  final String id;
  final String name;
  final String urlImage;
  final String shortExplanation;
  final List<String> longExplanation;
  final String currentArea;

  const BiomeEntity({
    required this.id,
    required this.name,
    required this.urlImage,
    required this.shortExplanation,
    required this.longExplanation,
    required this.currentArea,
  });
}
