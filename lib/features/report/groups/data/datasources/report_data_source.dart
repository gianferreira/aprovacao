import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/report/groups/data/models/group_report_model.dart';
import 'package:aprovacao/features/report/groups/domain/entities/group_report_entity.dart';

abstract class ReportDataSource {
  Future<List<GroupReportEntity>> generateReport({
    required String userId,
    required String moduleId,
  });
}

class ReportDataSourceImpl implements ReportDataSource {
  final FirestoreAPI api;

  ReportDataSourceImpl({
    required this.api,
  });

  @override
  Future<List<GroupReportEntity>> generateReport({
    required String userId,
    required String moduleId,
  }) async {
    try {
      final response = await api.generateReport(
        userId: userId,
        moduleId: moduleId,
      );
      
      return GroupReportModel.fromDataBase(
        snapshots: response,
      );
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
