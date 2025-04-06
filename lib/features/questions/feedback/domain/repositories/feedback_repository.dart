import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FeedbackRepository {
  Future<Either<Failure, bool>> sendQuestionsInfo({
    required QuestionsManagerEntity manager,
  });
}
