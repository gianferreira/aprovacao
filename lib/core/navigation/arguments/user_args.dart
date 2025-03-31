import 'package:aprovacao/core/navigation/arguments/args.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';

class UserArgs extends Args {
  final UserEntity user;

  UserArgs({
    required this.user,
  });
}
