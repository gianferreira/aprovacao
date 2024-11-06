import 'package:professional_development/features/contributions/list/domain/entities/contributions_entity.dart';

abstract class CreateContributionState {}

class CreateContributionEmpty extends CreateContributionState {}

class CreateContributionLoading extends CreateContributionState {}

class CreateContributionSuccess extends CreateContributionState {
  final ContributionEntity contribution;

  CreateContributionSuccess({
    required this.contribution,
  });
}

class CreateContributionError extends CreateContributionState {
  final String errorMessage;

  CreateContributionError({
    required this.errorMessage,
  });
}
