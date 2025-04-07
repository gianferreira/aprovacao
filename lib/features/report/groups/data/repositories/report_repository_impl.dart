import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/report/groups/data/datasources/report_data_source.dart';
import 'package:aprovacao/features/report/groups/domain/entities/group_report_entity.dart';
import 'package:aprovacao/features/report/groups/domain/repositories/report_repository.dart';
import 'package:dartz/dartz.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportDataSource dataSource;

  ReportRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<GroupReportEntity>>> generateReport({
    required String userId,
    required String moduleId,
  }) async {
    try {
      final result = await dataSource.generateReport(
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
