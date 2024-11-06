import 'package:professional_development/features/biome/list/domain/entities/biome_entity.dart';

abstract class BiomeState {}

class BiomeEmpty extends BiomeState {}

class BiomeLoading extends BiomeState {}

class BiomeSuccess extends BiomeState {
  final List<BiomeEntity> biomes;

  BiomeSuccess({
    required this.biomes,
  });
}

class BiomeError extends BiomeState {
  final String errorMessage;

  BiomeError({
    required this.errorMessage,
  });
}
