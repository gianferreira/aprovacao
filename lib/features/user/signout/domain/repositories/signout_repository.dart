import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SignoutRepository {
  Future<Either<Failure, void>> logout();
}
