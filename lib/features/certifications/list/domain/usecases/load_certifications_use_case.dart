import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/arch/use_case/use_case.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/certifications/list/domain/repositories/cartifications_repository.dart';
import 'package:dartz/dartz.dart';

class LoadCertificationsUsecase implements UseCase<List<CertificationEntity>, LoadCertificationsParams> {
  final CertificationsRepository repository;

  LoadCertificationsUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, List<CertificationEntity>>> call(
    LoadCertificationsParams params,
  ) async {
    final loadCertificationsResult = await repository.loadCertifications(
      userId: params.userId,
    );

    return loadCertificationsResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar carregar as certificações, tente novamente.',
              ),
        );
      },
      (success) {
        return Right(success);
      },
    );
  }
}

class LoadCertificationsParams {
  final String userId;

  LoadCertificationsParams({
    required this.userId,
  });
}
