import 'package:aprovacao/features/report/groups/domain/entities/group_report_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupReportModel extends GroupReportEntity {
  GroupReportModel({
    required DateTime? nextRevisionDate,
    required int? revisionTime,
    required int? timesAnswered,
    required int? totalAnswers,
    required int? correctAnswers,
    required int? answerRating,
  }) : super(
    nextRevisionDate: nextRevisionDate ?? DateTime.now(),
    revisionTime: revisionTime ?? 0,
    timesAnswered: timesAnswered ?? 0,
    totalAnswers: totalAnswers ?? 0,
    correctAnswers: correctAnswers ?? 0,
    answerRating: answerRating ?? 0,
  );

  factory GroupReportModel.fromJson({
    required Map<String, dynamic> group,
  }) {
    DateTime nextRevisionDate = (
      group['nextRevisionDate'] as Timestamp
    ).toDate(); 

    return GroupReportModel(
      nextRevisionDate: nextRevisionDate,
      revisionTime: group['revisionTime'],
      timesAnswered: group['timesAnswered'],
      totalAnswers: group['totalAnswers'],
      correctAnswers: group['correctAnswers'],
      answerRating: group['answerRating'],
    );
  }

  static List<GroupReportEntity> fromDataBase({
    required GroupsReportsSnapshots snapshots,
  }) {
    final groups = <GroupReportEntity>[];

    snapshots.forEach((element) { 
      groups.add(GroupReportModel.fromJson(
        group: element,
      ));
    });

    return groups;
  }
}
