import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/arch/use_case/use_case.dart';
import 'package:aprovacao/features/user/signin/domain/repositories/signin_repository.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class SignInUsecase implements UseCase<UserEntity, SignInParams> {
  final SignInRepository repository;

  SignInUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, UserEntity>> call(
    SignInParams params,
  ) async {
    final signInResult = await repository.signIn(
      email: params.email,
      password: params.password,
    );

    return signInResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar realizar o login.',
              ),
        );
      },
      (success) async {
        final getUserResult = await repository.getUserById(
          id: success.user?.uid ?? '',
        );

        return getUserResult.fold(
          (failure) {
            return Left(
              ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar buscar o usuário.',
              ),
            );
          },
          (success) {
            return Right(success);
          }
        );
      },
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
