abstract class SignoutState {}

class SignoutEmpty extends SignoutState {}

class SignoutLoading extends SignoutState {}

class SignoutSuccess extends SignoutState {}

class SignoutError extends SignoutState {
  final String errorMessage;

  SignoutError({
    required this.errorMessage,
  });
}
