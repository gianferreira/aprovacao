import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/arch/use_case/use_case.dart';
import 'package:aprovacao/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:aprovacao/features/contributions/list/domain/repositories/contributions_repository.dart';
import 'package:dartz/dartz.dart';

class LoadContributionsUsecase implements UseCase<List<ContributionEntity>, LoadContributionsParams> {
  final ContributionRepository repository;

  LoadContributionsUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, List<ContributionEntity>>> call(
    LoadContributionsParams params,
  ) async {
    final loadContributionsResult = await repository.loadContributionsFromBiome(
      id: params.biomeId,
    );

    return loadContributionsResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar carregar as contribuições, tente novamente em alguns minutos.',
              ),
        );
      },
      (success) {
        return Right(success);
      },
    );
  }
}

class LoadContributionsParams {
  final String biomeId;

  LoadContributionsParams({
    required this.biomeId,
  });
}
