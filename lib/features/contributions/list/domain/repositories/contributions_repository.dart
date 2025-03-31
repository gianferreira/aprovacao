import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ContributionRepository {
  Future<Either<Failure, List<ContributionEntity>>> loadContributionsFromBiome({
    required String id,
  });
}
