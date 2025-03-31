import 'package:aprovacao/core/navigation/arguments/args.dart';
import 'package:aprovacao/features/biome/list/domain/entities/biome_entity.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';

class BiomeArgs extends Args {
  final BiomeEntity biome;
  final UserEntity user;

  BiomeArgs({
    required this.biome,
    required this.user,
  });
}
