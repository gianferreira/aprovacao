import 'package:aprovacao/features/questions/manager/data/models/question_model.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/group_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/question_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel extends GroupEntity {
  GroupModel({
    required String? id,
    required String? userGroupId,
    required DateTime? nextRevisionDate,
    required int? revisionTime,
    required int? timesAnswered,
    required int? totalAnswers,
    required int? correctAnswers,
    required double? answerRating,
    required List<QuestionEntity>? questions, 
  }) : super(
    id: id ?? '',
    userGroupId: userGroupId ?? '',
    nextRevisionDate: nextRevisionDate ?? DateTime.now(),
    revisionTime: revisionTime ?? 0,
    timesAnswered: timesAnswered ?? 0,
    totalAnswers: totalAnswers ?? 0,
    correctAnswers: correctAnswers ?? 0,
    answerRating: answerRating ?? 0.0,
    questions: questions ?? [],
  );

  factory GroupModel.fromJson({
    required Map<String, dynamic> group,
    required List<Map<String, dynamic>> questions,
  }) {
    DateTime nextRevisionDate = (
      group['nextRevisionDate'] as Timestamp
    ).toDate(); 

    return GroupModel(
      id: group['group_id'],
      userGroupId: group['id'],
      nextRevisionDate: nextRevisionDate,
      revisionTime: group['revisionTime'],
      timesAnswered: group['timesAnswered'],
      totalAnswers: group['totalAnswers'],
      correctAnswers: group['correctAnswers'],
      answerRating: double.parse(group['answerRating'].toString()),
      questions: QuestionModel.fromList(jsonList: questions),
    );
  }

  static GroupEntity fromDataBase({
    required QuestionsGroupsSnapshots snapshots,
  }) {
    final group = GroupModel.fromJson(
      group: snapshots.group,
      questions: snapshots.questions,
    );

    return group;
  }
}
