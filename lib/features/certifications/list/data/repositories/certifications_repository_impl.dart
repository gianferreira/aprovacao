import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/certifications/list/data/datasources/certifications_data_source.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/certifications/list/domain/repositories/cartifications_repository.dart';
import 'package:dartz/dartz.dart';

class CertificationsRepositoryImpl implements CertificationsRepository {
  final CertificationsDataSource dataSource;

  CertificationsRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<CertificationEntity>>> loadCertifications({
    required String userId,
  }) async {
    try {
      final result = await dataSource.loadCertifications(
        userId: userId,
      );

      return Right(result);
    } on ServerFailureWithMessage catch (error) {
      return Left(
        ServerFailureWithMessage(error.code, error.message),
      );
    } on ServerFailure catch (error) {
      return Left(
        ServerFailure(error.code),
      );
    }
  }
}
