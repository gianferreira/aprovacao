import 'package:professional_development/features/biome/list/domain/entities/biome_entity.dart';

class BiomeModel extends BiomeEntity {
  BiomeModel({
    required String? id,
    required String? name,
    required String? urlImage,
    required String? shortExplanation,
    required List<String>? longExplanation,
    required String? currentArea,
  }) : super(
    id: id ?? '',
    name: name ?? '',
    urlImage: urlImage ?? '',
    shortExplanation: shortExplanation ?? '',
    longExplanation: longExplanation ?? const [],
    currentArea: currentArea ?? '',
  );

  factory BiomeModel.fromJson(Map<String, dynamic> json) {
    final longExplanation = <String>[];

    for (String item in json['longExplanation']) {
      longExplanation.add(item);
    }

    return BiomeModel(
      id: json['id'],
      name: json['name'],
      urlImage: json['urlImage'],
      shortExplanation: json['shortExplanation'],
      longExplanation: longExplanation,
      currentArea: json['currentArea'],
    );
  }

  static List<BiomeEntity> fromList(List<Map<String, dynamic>> json) {
    final biomes = <BiomeEntity>[];

    for (Map<String, dynamic> item in json) {
      biomes.add(BiomeModel.fromJson(item));
    }

    return biomes;
  }
}
