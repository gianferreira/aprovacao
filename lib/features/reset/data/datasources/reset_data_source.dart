import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';

abstract class ResetDataSource {
  Future<bool> resetProgress({
    required String userId,
    required String certificationId,
  });
}

class ResetDataSourceImpl implements ResetDataSource {
  final FirestoreAPI api;

  ResetDataSourceImpl({
    required this.api,
  });

  @override
  Future<bool> resetProgress({
    required String userId,
    required String certificationId,
  }) async {
    try {
      final response = await api.resetProgress(
        userId: userId,
        certificationId: certificationId,
      );
      
      return response;
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
