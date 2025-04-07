import 'package:aprovacao/features/report/groups/domain/entities/group_report_entity.dart';
import 'package:aprovacao/features/report/groups/presentation/widgets/report_dashboard_info.dart';
import 'package:aprovacao/features/report/groups/presentation/widgets/report_dashboard_revision_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GroupReportDashboard extends StatelessWidget {
  const GroupReportDashboard({
    super.key,
    required this.groupReport,
    required this.sequence,
  });

  final GroupReportEntity groupReport;
  final int sequence;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 24.0),
        Divider(
          height: 2.0,
          thickness: 2.0,
          color: Color(0xFFEDEDED),
        ),
        const SizedBox(height: 0.0),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Text(
            '$sequenceº grupo de questões',
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0075FF),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ReportDashboardInfo(
                  label: 'Revisões realizadas',
                  value: groupReport.timesAnswered.toString(),
                  isModule: false,
                ),
                ReportDashboardInfo(
                  label: 'Questões respondidas',
                  value: groupReport.totalAnswers.toString(),
                  isModule: false,
                ),
                ReportDashboardInfo(
                  label: 'Acertos',
                  value: groupReport.correctAnswers.toString(),
                  isModule: false,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 40.0,
                bottom: 32.0,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text(
                    '${groupReport.answerRating}%',
                    style: TextStyle(
                      fontFamily: 'MyriadProRegular',
                      height: 1.2,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0075FF),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                    width: 60.0,
                    child: Expanded(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF0075FF),
                        ),
                        backgroundColor: Color(0xFFB3B3B3).withOpacity(0.3),
                        value: groupReport.answerRating / 100,
                        strokeWidth: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        ReportDashboardRevisionInfo(
          label: 'Revisão espaçada atualmente em:',
          value: '${groupReport.revisionTime} dias',
        ),
        ReportDashboardRevisionInfo(
          label: 'Próxima revisão em:',
          value: DateFormat('dd/MM/yyyy').format(
            groupReport.nextRevisionDate,
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
