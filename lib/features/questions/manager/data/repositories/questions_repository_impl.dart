import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/questions/manager/data/datasources/questions_data_source.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/group_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/repositories/questions_repository.dart';
import 'package:dartz/dartz.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsDataSource dataSource;

  QuestionsRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, GroupEntity>> loadQuestions({
    required String userId,
    required String moduleId,
  }) async {
    try {
      final result = await dataSource.loadQuestions(
        userId: userId,
        moduleId: moduleId,
      );

      return Right(result);
    } on ServerFailureWithMessage catch (error) {
      return Left(
        ServerFailureWithMessage(error.code, error.message),
      );
    } on ServerFailure catch (error) {
      return Left(
        ServerFailure(error.code),
      );
    }
  }
}
