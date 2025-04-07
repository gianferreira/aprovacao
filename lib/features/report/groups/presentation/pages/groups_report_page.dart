import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_error.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_loading_view.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/report/groups/presentation/pages/groups_report_view.dart';
import 'package:aprovacao/features/report/groups/presentation/stores/report_controller.dart';
import 'package:aprovacao/features/report/groups/presentation/stores/report_state.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/report/groups/report_injection_container.dart' as report_dependencies;

class GroupsReportPage extends StatefulWidget {
  const GroupsReportPage({
    super.key,
    required this.user,
    required this.module,
    required this.certification,
  });

  final UserEntity user;
  final ModuleEntity module;
  final CertificationEntity certification;

  @override
  State<GroupsReportPage> createState() => _GroupsReportPageState();
}

class _GroupsReportPageState extends State<GroupsReportPage> {
  late ReportController reportController;

  @override
  void initState() {
    reportController = report_dependencies.sl<ReportController>();
    reportController.generateReport(
      user: widget.user,
      module: widget.module,
    );

    super.initState();
  }

  @override
  void dispose() {
    reportController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ReportState>(
      valueListenable: reportController, 
      builder: (context, state, child) {
        if(state is ReportSuccess) {
          return GroupsReportView(
            module: widget.module,
            moduleReport: state.report,
          );
        } else if(state is ReportLoading) {
          return AprovacaoLoadingView();
        } else {
          AprovacaoSnackBarError.show(
            context: context,
            title: 'Ocorreu um erro, ao tentar carregar o relatório do módulo.',
            message: 'Por favor, tente prosseguir em alguns instantes.',
          );
          
          return AprovacaoNavigatorBuilder.pop(context: context);
        }
      },
    );
  }
}
