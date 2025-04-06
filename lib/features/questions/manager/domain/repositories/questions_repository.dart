import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/group_entity.dart';
import 'package:dartz/dartz.dart';

abstract class QuestionsRepository {
  Future<Either<Failure, GroupEntity>> loadQuestions({
    required String userId,
    required String moduleId,
  });
}
