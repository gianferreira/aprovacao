import 'package:aprovacao/features/biome/details/presentation/pages/biome_details_view.dart';
import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class BiomeDetailsPage extends StatelessWidget {
  const BiomeDetailsPage({
    super.key,
    required this.biome,
    required this.user,
  });

  final BiomeEntity biome;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return BiomeDetailsView(
      biome: biome,
      user: user,
    );
  }
}
