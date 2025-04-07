import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/arch/use_case/use_case.dart';
import 'package:aprovacao/features/reset/domain/repositories/reset_repository.dart';
import 'package:dartz/dartz.dart';

class ResetProgressUsecase implements UseCase<bool, ResetProgressParams> {
  final ResetRepository repository;

  ResetProgressUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, bool>> call(
    ResetProgressParams params,
  ) async {
    final resetProgressResult = await repository.resetProgress(
      userId: params.userId,
      certificationId: params.certificationId,
    );

    return resetProgressResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar resetar o progresso.',
              ),
        );
      },
      (success) {
        return Right(success);
      },
    );
  }
}

class ResetProgressParams {
  final String userId;
  final String certificationId;

  ResetProgressParams({
    required this.userId,
    required this.certificationId,
  });
}
