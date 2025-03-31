import 'package:aprovacao/core/navigation/arguments/biome_args.dart';
import 'package:aprovacao/features/contributions/create/presentation/pages/create_contribution_view.dart';
import 'package:flutter/material.dart';

class CreateContributionPage extends StatelessWidget {
  const CreateContributionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BiomeArgs args = ModalRoute.of(context)?.settings.arguments as BiomeArgs;

    return CreateContributionView(
      biome: args.biome,
      user: args.user,
    );
  }
}
