import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/features/biome/list/domain/entities/biome_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BiomeRepository {
  Future<Either<Failure, List<BiomeEntity>>> loadBiomes();
}
