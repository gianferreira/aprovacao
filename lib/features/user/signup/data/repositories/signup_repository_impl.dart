import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/features/user/signup/data/datasources/auth_data_source.dart';
import 'package:professional_development/features/user/signup/data/datasources/user_data_source.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';
import 'package:professional_development/features/user/signup/domain/repositories/signup_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final AuthDataSource authDataSource;
  final UserDataSource userDataSource;

  SignUpRepositoryImpl({
    required this.authDataSource,
    required this.userDataSource,
  });

  @override
  Future<Either<Failure, UserCredential>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final result = await authDataSource.signUp(
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
  Future<Either<Failure, UserEntity>> createUser({
    required String id,
    required String name,
    required String email,
  }) async {
    try {
      final result = await userDataSource.createUser(
        email: email,
        name: name,
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
