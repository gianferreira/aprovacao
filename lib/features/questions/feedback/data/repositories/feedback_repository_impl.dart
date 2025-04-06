import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/questions/feedback/data/datasources/feedback_data_source.dart';
import 'package:aprovacao/features/questions/feedback/domain/repositories/feedback_repository.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:dartz/dartz.dart';

class FeedbackRepositoryImpl implements FeedbackRepository {
  final FeedbackDataSource dataSource;

  FeedbackRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, bool>> sendQuestionsInfo({
    required QuestionsManagerEntity manager,
  }) async {
    try {
      final result = await dataSource.sendQuestionsInfo(
        manager: manager,
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
