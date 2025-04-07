abstract class ResetState {}

class ResetEmpty extends ResetState {}

class ResetLoading extends ResetState {}

class ResetSuccess extends ResetState {}

class ResetError extends ResetState {
  final String errorMessage;

  ResetError({
    required this.errorMessage,
  });
}
