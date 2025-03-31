import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:aprovacao/features/contributions/list/presentation/stores/contributions_controller.dart';
import 'package:aprovacao/features/contributions/list/presentation/stores/contributions_state.dart';
import 'package:aprovacao/features/contributions/list/presentation/widgets/contributions_error.dart';
import 'package:aprovacao/features/contributions/list/presentation/widgets/contributions_list.dart';
import 'package:aprovacao/features/contributions/list/presentation/widgets/button_load_contributions.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/contributions/list/contributions_injection_container.dart' as contribution_dependencies;

class LoadContributionsHandler extends StatefulWidget {
  const LoadContributionsHandler({
    super.key,
    required this.biome,
    required this.user,
    required this.scrollController,
  });

  final BiomeEntity biome;
  final UserEntity user;
  final ScrollController scrollController;

  @override
  State<LoadContributionsHandler> createState() => _LoadContributionsHandlerState();
}

class _LoadContributionsHandlerState extends State<LoadContributionsHandler> {
  late ContributionController contributionController;

  @override
  void initState() {
    contributionController = contribution_dependencies.sl<ContributionController>();

    super.initState();
  }

  @override
  void dispose() {
    contributionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ContributionState>(
      valueListenable: contributionController,
      builder: (context, state, child) {
        if(state is ContributionSuccess) {
          widget.scrollController.jumpTo(
            widget.scrollController.position.maxScrollExtent + 1000,
          );

          return ContributionsList(
            contributions: state.contributions,
            biome: widget.biome,
            user: widget.user,
          );
        } else if(state is ContributionError) {
          widget.scrollController.jumpTo(
            widget.scrollController.position.maxScrollExtent + 1000,
          );

          return ContributionsError(errorMessage: state.errorMessage);
        } else {
          return LoadContributionsButton(
            isLoading: state is ContributionLoading,
            onPressed: () {
              contributionController.loadContributionsFromBiome(
                id: widget.biome.id,
              );
            }, 
          );
        }
      }
    );
  }
}
