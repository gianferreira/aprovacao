import 'package:aprovacao/core/navigation/arguments/biome_args.dart';
import 'package:aprovacao/features/biome/details/presentation/pages/biome_details_view.dart';
import 'package:flutter/material.dart';

class BiomeDetailsPage extends StatelessWidget {
  const BiomeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BiomeArgs args = ModalRoute.of(context)?.settings.arguments as BiomeArgs;

    return BiomeDetailsView(
      biome: args.biome,
      user: args.user,
    );
  }
}
