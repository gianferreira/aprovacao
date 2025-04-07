import 'package:aprovacao/features/report/groups/domain/entities/group_report_entity.dart';

class ModuleReportEntity {
  final int timesAnswered;
  final int totalAnswers; 
  final int correctAnswers;
  final int answerRating;
  final List<GroupReportEntity> groups;

  const ModuleReportEntity({
    required this.timesAnswered,
    required this.totalAnswers,
    required this.correctAnswers,
    required this.answerRating,
    required this.groups,
  });
}
