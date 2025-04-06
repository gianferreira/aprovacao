import 'package:aprovacao/features/questions/manager/domain/entities/question_entity.dart';

class GroupEntity {
  final String id;
  final String userGroupId;
  final DateTime nextRevisionDate;          
  final int revisionTime;
  final int timesAnswered;
  final int totalAnswers; 
  final int correctAnswers;
  final double answerRating;
  final List<QuestionEntity> questions;

  const GroupEntity({
    required this.id,
    required this.userGroupId,
    required this.nextRevisionDate,
    required this.revisionTime,
    required this.timesAnswered,
    required this.totalAnswers,
    required this.correctAnswers,
    required this.answerRating,
    required this.questions,
  });
}

typedef QuestionsGroupsSnapshots =  ({
  Map<String, dynamic> group,
  List<Map<String, dynamic>> questions, 
});
