import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/core/arch/use_case/use_case.dart';
import 'package:professional_development/features/contributions/create/domain/repositories/create_contribution_repository.dart';
import 'package:professional_development/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:dartz/dartz.dart';

class CreateContributionUsecase implements UseCase<ContributionEntity, CreateContributionParams> {
  final CreateContributionRepository repository;

  CreateContributionUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, ContributionEntity>> call(
    CreateContributionParams params,
  ) async {
    final createContributionResult = await repository.createContribution(
      contribution: params.contribution,
    );

    return createContributionResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar criar a contribuição.',
              ),
        );
      },
      (success) {
        return Right(success);
      }
    );
  }
}

class CreateContributionParams {
  final ContributionEntity contribution;

  CreateContributionParams({
    required this.contribution,
  });
}
