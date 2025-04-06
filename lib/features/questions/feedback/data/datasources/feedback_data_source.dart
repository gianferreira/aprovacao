import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';

abstract class FeedbackDataSource {
  Future<bool> sendQuestionsInfo({
    required QuestionsManagerEntity manager,
  });
}

class FeedbackDataSourceImpl implements FeedbackDataSource {
  final FirestoreAPI api;

  FeedbackDataSourceImpl({
    required this.api,
  });

  @override
  Future<bool> sendQuestionsInfo({
    required QuestionsManagerEntity manager,
  }) async {
    try {
      final response = await api.sendQuestionsInfo(
        manager: manager,
      );
      
      return response;
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
