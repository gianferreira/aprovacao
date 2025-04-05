import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CertificationsRepository {
  Future<Either<Failure, List<CertificationEntity>>> loadCertifications({
    required String userId,
  });
}
