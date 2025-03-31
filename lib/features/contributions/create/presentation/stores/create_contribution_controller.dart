import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:aprovacao/features/contributions/create/domain/usecases/create_contribution_use_case.dart';
import 'package:aprovacao/features/contributions/create/presentation/stores/create_contribution_state.dart';
import 'package:aprovacao/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class CreateContributionController extends ValueNotifier<CreateContributionState> {
  CreateContributionController({
    required this.usecase,
  }) : super(CreateContributionEmpty());

  final CreateContributionUsecase usecase;

  void createContribution({
    required String title,
    required String description,
    required UserEntity user,
    required BiomeEntity biome,
  }) async {
    value = CreateContributionLoading();

    final contributionEntity = ContributionEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(), 
      userId: user.id, 
      userName: user.name, 
      biomeId: biome.id, 
      title: title, 
      description: description,
    );

    final createContributionResult = await usecase(
      CreateContributionParams(
        contribution: contributionEntity, 
      ),
    );

    createContributionResult.fold(
      (failure) {
        value = CreateContributionError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = CreateContributionSuccess(
          contribution: success,
        );
      },
    );
  }
}
