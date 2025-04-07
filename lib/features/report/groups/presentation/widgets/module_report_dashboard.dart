import 'package:aprovacao/features/report/groups/presentation/widgets/report_dashboard_info.dart';
import 'package:flutter/material.dart';

class ModuleReportDashboard extends StatelessWidget {
  const ModuleReportDashboard({
    super.key,
    required this.moduleName,
    required this.timesAnswered,
    required this.totalAnswers,
    required this.correctAnswers,
    required this.answerRating,
  });

  final String moduleName;
  final int timesAnswered;
  final int totalAnswers; 
  final int correctAnswers;
  final int answerRating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Text(
            moduleName,
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF02CEFD),
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
                  value: timesAnswered.toString(),
                  isModule: true,
                ),
                ReportDashboardInfo(
                  label: 'Questões respondidas',
                  value: totalAnswers.toString(),
                  isModule: true,
                ),
                ReportDashboardInfo(
                  label: 'Acertos',
                  value: correctAnswers.toString(),
                  isModule: true,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32.0,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text(
                    '$answerRating%',
                    style: TextStyle(
                      fontFamily: 'MyriadProRegular',
                      height: 1.2,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF02CEFD),
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                    width: 80.0,
                    child: Expanded(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF02CEFD),
                        ),
                        backgroundColor: Color(0xFFB3B3B3).withOpacity(0.3),
                        value: answerRating / 100,
                        strokeWidth: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
