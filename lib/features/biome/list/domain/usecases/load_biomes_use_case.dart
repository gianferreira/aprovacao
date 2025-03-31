import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/arch/use_case/use_case.dart';
import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:aprovacao/features/biome/list/domain/repositories/biome_repository.dart';
import 'package:dartz/dartz.dart';

class LoadBiomesUsecase implements UseCase<List<BiomeEntity>, NoParams> {
  final BiomeRepository repository;

  LoadBiomesUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, List<BiomeEntity>>> call(
    NoParams params,
  ) async {
    final loadBiomesResult = await repository.loadBiomes();

    return loadBiomesResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar carregar os biomas, por favor, tente novamente em alguns minutos.',
              ),
        );
      },
      (success) {
        return Right(success);
      },
    );
  }
}
