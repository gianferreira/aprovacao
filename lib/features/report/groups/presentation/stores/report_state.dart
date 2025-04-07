import 'package:aprovacao/features/report/groups/domain/entities/module_report_entity.dart';

abstract class ReportState {}

class ReportEmpty extends ReportState {}

class ReportLoading extends ReportState {}

class ReportSuccess extends ReportState {
  final ModuleReportEntity report;

  ReportSuccess({
    required this.report,
  });
}

class ReportError extends ReportState {
  final String errorMessage;

  ReportError({
    required this.errorMessage,
  });
}
