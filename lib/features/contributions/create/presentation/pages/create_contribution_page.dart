import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:aprovacao/features/contributions/create/presentation/pages/create_contribution_view.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class CreateContributionPage extends StatelessWidget {
  const CreateContributionPage({
    super.key,
    required this.biome,
    required this.user,
  });

  final BiomeEntity biome;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return CreateContributionView(
      biome: biome,
      user: user,
    );
  }
}
