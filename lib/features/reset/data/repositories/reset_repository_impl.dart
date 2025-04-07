import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/reset/data/datasources/reset_data_source.dart';
import 'package:aprovacao/features/reset/domain/repositories/reset_repository.dart';
import 'package:dartz/dartz.dart';

class ResetRepositoryImpl implements ResetRepository {
  final ResetDataSource dataSource;

  ResetRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, bool>> resetProgress({
    required String userId,
    required String certificationId,
  }) async {
    try {
      final result = await dataSource.resetProgress(
        userId: userId,
        certificationId: certificationId,
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
