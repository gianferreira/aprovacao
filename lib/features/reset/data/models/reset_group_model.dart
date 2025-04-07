import 'package:aprovacao/features/reset/domain/entities/reset_group_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResetGroupModel extends ResetGroupEntity {
  ResetGroupSnapshot toJson({
    required Map<String, dynamic> group,
  }) {
    Timestamp nextRevisionDate = Timestamp.fromDate(
      DateTime.now(),
    );

    return {
      'id': group['id'],
      'group_id': group['group_id'],
      'user_id': group['user_id'],
      'answerRating': answerRating,
      'correctAnswers': correctAnswers,
      'totalAnswers': totalAnswers,
      'timesAnswered': timesAnswered,
      'revisionTime': revisionTime,
      'nextRevisionDate': nextRevisionDate, 
    };
  }
}
