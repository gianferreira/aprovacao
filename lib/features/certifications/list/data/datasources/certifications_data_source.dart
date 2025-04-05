import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/certifications/list/data/models/certification_model.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';

abstract class CertificationsDataSource {
  Future<List<CertificationEntity>> loadCertifications({
    required String userId,
  });
}

class CertificationsDataSourceImpl implements CertificationsDataSource {
  final FirestoreAPI api;

  CertificationsDataSourceImpl({
    required this.api,
  });

  @override
  Future<List<CertificationEntity>> loadCertifications({
    required String userId,
  }) async {
    try {
      final response = await api.getCertifications(
        userId: userId,
      );
      
      return CertificationModel.fromDataBase(
        snapshots: response,
      );
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
