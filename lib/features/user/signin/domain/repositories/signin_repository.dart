import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInRepository {
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> getUserById({
    required String id,
  });
}
