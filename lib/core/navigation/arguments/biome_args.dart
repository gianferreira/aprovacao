import 'package:professional_development/core/navigation/arguments/args.dart';
import 'package:professional_development/features/biome/list/domain/entities/biome_entity.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';

class BiomeArgs extends Args {
  final BiomeEntity biome;
  final UserEntity user;

  BiomeArgs({
    required this.biome,
    required this.user,
  });
}
