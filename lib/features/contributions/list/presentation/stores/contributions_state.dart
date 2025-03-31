import 'package:aprovacao/features/contributions/list/domain/entities/contributions_entity.dart';

abstract class ContributionState {}

class ContributionEmpty extends ContributionState {}

class ContributionLoading extends ContributionState {}

class ContributionSuccess extends ContributionState {
  final List<ContributionEntity> contributions;

  ContributionSuccess({
    required this.contributions,
  });
}

class ContributionError extends ContributionState {
  final String errorMessage;

  ContributionError({
    required this.errorMessage,
  });
}
