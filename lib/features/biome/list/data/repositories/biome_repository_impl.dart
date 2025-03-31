import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/biome/list/data/datasources/biome_data_source.dart';
import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:aprovacao/features/biome/list/domain/repositories/biome_repository.dart';
import 'package:dartz/dartz.dart';

class BiomeRepositoryImpl implements BiomeRepository {
  final BiomeDataSource dataSource;

  BiomeRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<BiomeEntity>>> loadBiomes() async {
    try {
      final result = await dataSource.loadBiomes();

      return Right(result);
    } on ServerFailureWithMessage catch (error) {
      return Left(
        ServerFailureWithMessage(error.code, error.message),
      );
    } on ServerFailure catch (error) {
      return Left(
        ServerFailure(error.code),
      );
    }
  }
}
