import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_empty_view.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scrollable_view.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/report/groups/domain/entities/module_report_entity.dart';
import 'package:aprovacao/features/report/groups/presentation/widgets/group_report_dashboard.dart';
import 'package:aprovacao/features/report/groups/presentation/widgets/module_report_dashboard.dart';
import 'package:flutter/material.dart';

class GroupsReportView extends StatelessWidget {
  const GroupsReportView({
    super.key,
    required this.moduleReport,
    required this.module,
  });

  final ModuleReportEntity moduleReport;
  final ModuleEntity module;

  @override
  Widget build(BuildContext context) {
    return AprovacaoScrollableView(
      appBar: AprovacaoAppBar(
        title: 'Relatório',
        onBackButtonPressed: () {
          AprovacaoNavigator.pop(context: context);
        },
      ),
      itens: <Widget>[
        ModuleReportDashboard(
          moduleName: module.title,
          timesAnswered: moduleReport.timesAnswered,
          totalAnswers: moduleReport.totalAnswers,
          correctAnswers: moduleReport.correctAnswers,
          answerRating: moduleReport.answerRating,
        ),
        ...List.generate(
          moduleReport.groups.length, 
          (index) => GroupReportDashboard(
            sequence: index + 1,
            groupReport: moduleReport.groups[index], 
          ),
        ),
      ], 
      noButton: true,
      button: AprovacaoEmptyView(),
    );
  }
}
