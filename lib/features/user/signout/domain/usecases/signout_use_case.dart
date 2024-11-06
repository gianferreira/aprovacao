import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/core/arch/use_case/use_case.dart';
import 'package:professional_development/features/user/signout/domain/repositories/signout_repository.dart';
import 'package:dartz/dartz.dart';

class SignoutUsecase implements UseCase<void, NoParams> {
  final SignoutRepository repository;

  SignoutUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, void>> call(
    NoParams params,
  ) async {
    final logoutResult = await repository.logout();

    return logoutResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar realizar o logout.',
              ),
        );
      },
      (success) async {
        return Right(success);
      },
    );
  }
}
