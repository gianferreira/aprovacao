class GroupReportEntity {
  final DateTime nextRevisionDate;          
  final int revisionTime;
  final int timesAnswered;
  final int totalAnswers; 
  final int correctAnswers;
  final int answerRating;

  const GroupReportEntity({
    required this.nextRevisionDate,
    required this.revisionTime,
    required this.timesAnswered,
    required this.totalAnswers,
    required this.correctAnswers,
    required this.answerRating,
  });
}

typedef GroupsReportsSnapshots = List<Map<String, dynamic>>;
