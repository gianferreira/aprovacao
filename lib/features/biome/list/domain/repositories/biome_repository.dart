import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BiomeRepository {
  Future<Either<Failure, List<BiomeEntity>>> loadBiomes();
}
