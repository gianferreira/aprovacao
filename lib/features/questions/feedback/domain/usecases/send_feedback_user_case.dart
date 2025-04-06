import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/arch/use_case/use_case.dart';
import 'package:aprovacao/features/questions/feedback/domain/repositories/feedback_repository.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/group_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:dartz/dartz.dart';

class SendFeedbackUsecase implements UseCase<int, SendFeedbackParams> {
  final FeedbackRepository repository;

  SendFeedbackUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, int>> call(
    SendFeedbackParams params,
  ) async {
    final corrects = params.manager.corrects;
    final difficulty = params.manager.difficulty;
    final questionsLength = params.manager.questions.length;

    final updatedTimesAnswered = params.manager.group.timesAnswered + 1;
    final updatedTotalAnswers = params.manager.group.totalAnswers + questionsLength;
    final updatedCorrectAnswers = params.manager.group.correctAnswers + corrects;
    final updatedAnswerRating = (updatedCorrectAnswers / updatedTotalAnswers * 100).toInt();

    int updatedRevisionTime = params.manager.group.revisionTime;
    DateTime updatedNextRevisionDate = params.manager.group.nextRevisionDate;

    if (corrects > 3)
      updatedRevisionTime = updatedRevisionTime + 2;
    else if (corrects > 2)
        updatedRevisionTime = updatedRevisionTime + 1;
    else if (corrects > 1)
        updatedRevisionTime = updatedRevisionTime;
    else 
        updatedRevisionTime = updatedRevisionTime - 1;

    if (difficulty == 1)
      updatedRevisionTime = updatedRevisionTime + 2;
    else if (difficulty == 2)
        updatedRevisionTime = updatedRevisionTime + 1;
    else if (difficulty == 3)
        updatedRevisionTime = updatedRevisionTime;
    else 
        updatedRevisionTime = updatedRevisionTime - 1;
      
    if (updatedRevisionTime < 2)
      updatedRevisionTime = 2;
    else if (updatedRevisionTime > 10)
      updatedRevisionTime = 10;

    updatedNextRevisionDate = DateTime.now().add(
      Duration(days: updatedRevisionTime),
    );

    GroupEntity updatedGroup = params.manager.group.copyWith(
      nextRevisionDate: updatedNextRevisionDate,
      revisionTime: updatedRevisionTime,
      timesAnswered: updatedTimesAnswered,
      totalAnswers: updatedTotalAnswers,
      correctAnswers: updatedCorrectAnswers,
      answerRating: updatedAnswerRating,
    );
    
    final sendQuestionsResult = await repository.sendQuestionsInfo(
      manager: params.manager.copyWith(
        group: updatedGroup,
      ),
    );

    return sendQuestionsResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar enviar as questões, tente novamente.',
              ),
        );
      },
      (success) {
        return Right(updatedRevisionTime);
      },
    );
  }
}

class SendFeedbackParams {
  final QuestionsManagerEntity manager;

  SendFeedbackParams({
    required this.manager,
  });
}
