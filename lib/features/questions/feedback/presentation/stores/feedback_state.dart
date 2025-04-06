abstract class FeedbackState {}

class FeedbackEmpty extends FeedbackState {}

class FeedbackLoading extends FeedbackState {}

class FeedbackSuccess extends FeedbackState {
  final int updatedRevisionTime;

  FeedbackSuccess({
    required this.updatedRevisionTime,
  });
}

class FeedbackError extends FeedbackState {
  final String errorMessage;

  FeedbackError({
    required this.errorMessage,
  });
}
