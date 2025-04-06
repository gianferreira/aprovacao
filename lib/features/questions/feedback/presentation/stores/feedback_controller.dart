import 'package:aprovacao/features/questions/feedback/domain/usecases/send_feedback_user_case.dart';
import 'package:aprovacao/features/questions/feedback/presentation/stores/feedback_state.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:flutter/material.dart';

class FeedbackController extends ValueNotifier<FeedbackState> {
  FeedbackController({
    required this.usecase,
  }) : super(FeedbackEmpty());

  final SendFeedbackUsecase usecase;

  void sendFeedback({
    required QuestionsManagerEntity manager,
  }) async {
    value = FeedbackLoading();

    final sendFeedbackResult = await usecase(SendFeedbackParams(
      manager: manager,
    ));

    sendFeedbackResult.fold(
      (failure) {
        value = FeedbackError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = FeedbackSuccess(
          updatedRevisionTime: success,
        );
      },
    );
  }
}
