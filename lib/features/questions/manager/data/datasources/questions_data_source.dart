import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/questions/manager/data/models/group_model.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/group_entity.dart';

abstract class QuestionsDataSource {
  Future<GroupEntity> loadQuestions({
    required String userId,
    required String moduleId,
  });
}

class QuestionsDataSourceImpl implements QuestionsDataSource {
  final FirestoreAPI api;

  QuestionsDataSourceImpl({
    required this.api,
  });

  @override
  Future<GroupEntity> loadQuestions({
    required String userId,
    required String moduleId,
  }) async {
    try {
      final response = await api.getQuestions(
        userId: userId,
        moduleId: moduleId,
      );
      
      return GroupModel.fromDataBase(
        snapshots: response,
      );
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
