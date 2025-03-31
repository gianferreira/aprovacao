import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/contributions/list/data/datasources/contributions_data_source.dart';
import 'package:aprovacao/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:aprovacao/features/contributions/list/domain/repositories/contributions_repository.dart';
import 'package:dartz/dartz.dart';

class ContributionRepositoryImpl implements ContributionRepository {
  final ContributionDataSource dataSource;

  ContributionRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<ContributionEntity>>> loadContributionsFromBiome({
    required String id,
  }) async {
    try {
      final result = await dataSource.loadContributionsFromBiome(
        id: id,
      );

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
