import 'package:professional_development/features/contributions/list/domain/usecases/load_contributions_use_case.dart';
import 'package:professional_development/features/contributions/list/presentation/stores/contributions_state.dart';
import 'package:flutter/material.dart';

class ContributionController extends ValueNotifier<ContributionState> {
  ContributionController({
    required this.usecase,
  }) : super(ContributionEmpty());

  final LoadContributionsUsecase usecase;

  void loadContributionsFromBiome({
    required String id,
  }) async {
    value = ContributionLoading();

    final loadBiomesResult = await usecase(LoadContributionsParams(
      biomeId: id,
    ));

    loadBiomesResult.fold(
      (failure) {
        value = ContributionError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = ContributionSuccess(
          contributions: success,
        );
      },
    );
  }
}
