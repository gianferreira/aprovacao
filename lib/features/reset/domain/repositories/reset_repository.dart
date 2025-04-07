import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ResetRepository {
  Future<Either<Failure, bool>> resetProgress({
    required String userId,
    required String certificationId,
  });
}
