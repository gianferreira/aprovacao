import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/arch/use_case/use_case.dart';
import 'package:aprovacao/features/questions/feedback/domain/repositories/feedback_repository.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:dartz/dartz.dart';

class SendFeedbackUsecase implements UseCase<int, SendFeedbackParams> {
  final FeedbackRepository repository;

  SendFeedbackUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, int>> call(
    SendFeedbackParams params,
  ) async {
    QuestionsManagerEntity updatedManager = params.manager;



    final sendQuestionsResult = await repository.sendQuestionsInfo(
      manager: updatedManager,
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
        return Right(updatedManager.group.revisionTime);
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
