import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/report/groups/domain/usecases/generate_report_use_case.dart';
import 'package:aprovacao/features/report/groups/presentation/stores/report_state.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ReportController extends ValueNotifier<ReportState> {
  ReportController({
    required this.usecase,
  }) : super(ReportEmpty());

  final GenerateReportUsecase usecase;

  void generateReport({
    required UserEntity user,
    required ModuleEntity module,
  }) async {
    value = ReportLoading();

    final loadReportResult = await usecase(GenerateReportParams(
      user: user,
      module: module,
    ));

    loadReportResult.fold(
      (failure) {
        value = ReportError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = ReportSuccess(
          report: success,
        );
      },
    );
  }
}
