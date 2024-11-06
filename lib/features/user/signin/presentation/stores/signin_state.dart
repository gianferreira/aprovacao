import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';

abstract class SignInState {}

class SignInEmpty extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity loggedUser;

  SignInSuccess({
    required this.loggedUser,
  });
}

class SignInError extends SignInState {
  final String errorMessage;

  SignInError({
    required this.errorMessage,
  });
}
