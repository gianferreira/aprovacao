import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/report/groups/domain/entities/group_report_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ReportRepository {
  Future<Either<Failure, List<GroupReportEntity>>> generateReport({
    required String userId,
    required String moduleId,
  });
}
