import 'package:aprovacao/features/questions/manager/domain/entities/question_entity.dart';

class GroupEntity {
  final String id;
  final String userGroupId;
  final DateTime nextRevisionDate;          
  final int revisionTime;
  final int timesAnswered;
  final int totalAnswers; 
  final int correctAnswers;
  final int answerRating;
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

  GroupEntity copyWith({
    String? id,
    String? userGroupId,
    DateTime? nextRevisionDate,          
    int? revisionTime,
    int? timesAnswered,
    int? totalAnswers,
    int? correctAnswers,
    int? answerRating,
    List<QuestionEntity>? questions,
  }) {
    return GroupEntity(
      id: id ?? this.id,
      userGroupId: userGroupId ?? this.userGroupId,
      nextRevisionDate: nextRevisionDate ?? this.nextRevisionDate,
      revisionTime: revisionTime ?? this.revisionTime,
      timesAnswered: timesAnswered ?? this.timesAnswered,
      totalAnswers: totalAnswers ?? this.totalAnswers,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      answerRating: answerRating ?? this.answerRating,
      questions: questions ?? this.questions,
    );
  }
}

typedef QuestionsGroupsSnapshots =  ({
  Map<String, dynamic> group,
  List<Map<String, dynamic>> questions, 
});
