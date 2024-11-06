import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/core/arch/use_case/use_case.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';
import 'package:professional_development/features/user/signup/domain/repositories/signup_repository.dart';
import 'package:dartz/dartz.dart';

class SignUsecase implements UseCase<UserEntity, SignParams> {
  final SignUpRepository repository;

  SignUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, UserEntity>> call(
    SignParams params,
  ) async {
    final signUpResult = await repository.signUp(
      email: params.email,
      password: params.password,
    );

    return signUpResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar realizar o cadastro.',
              ),
        );
      },
      (success) async {
        final createUserResult = await repository.createUser(
          id: success.user?.uid ?? '',
          email: params.email,
          name: params.name,
        );

        return createUserResult.fold(
          (failure) {
            return Left(
              ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar criar o usuário.',
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

class SignParams {
  final String name;
  final String email;
  final String password;

  SignParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
