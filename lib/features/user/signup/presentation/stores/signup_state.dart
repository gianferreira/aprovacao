import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';

abstract class SignUpState {}

class SignUpEmpty extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity loggedUser;

  SignUpSuccess({
    required this.loggedUser,
  });
}

class SignUpError extends SignUpState {
  final String errorMessage;

  SignUpError({
    required this.errorMessage,
  });
}
