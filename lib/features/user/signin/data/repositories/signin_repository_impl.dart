import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/user/signin/data/datasources/signin_data_source.dart';
import 'package:aprovacao/features/user/signin/domain/repositories/signin_repository.dart';
import 'package:aprovacao/features/user/signup/data/datasources/user_data_source.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDataSource signInDataSource;
  final UserDataSource userDataSource;

  SignInRepositoryImpl({
    required this.signInDataSource,
    required this.userDataSource,
  });

  @override
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await signInDataSource.signIn(
        email: email,
        password: password,
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

  @override
  Future<Either<Failure, UserEntity>> getUserById({
    required String id,
  }) async {
    try {
      final result = await userDataSource.getUser(
        id: id,
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
