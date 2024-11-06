import 'package:professional_development/core/navigation/arguments/args.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';

class UserArgs extends Args {
  final UserEntity user;

  UserArgs({
    required this.user,
  });
}
