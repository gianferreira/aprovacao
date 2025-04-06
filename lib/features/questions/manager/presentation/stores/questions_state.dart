import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';

abstract class QuestionsState {}

class QuestionsEmpty extends QuestionsState {}

class QuestionsLoading extends QuestionsState {}

class QuestionsSuccess extends QuestionsState {
  final QuestionsManagerEntity manager;

  QuestionsSuccess({
    required this.manager,
  });
}

class QuestionsError extends QuestionsState {
  final String errorMessage;

  QuestionsError({
    required this.errorMessage,
  });
}
