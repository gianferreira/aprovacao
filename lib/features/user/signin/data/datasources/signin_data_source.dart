import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/core/firebase/authentication/auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInDataSource {
  Future<UserCredential> signIn({
    required String email,
    required String password,
  });
}

class SignInDataSourceImpl implements SignInDataSource {
  final AuthAPI api;

  SignInDataSourceImpl({
    required this.api,
  });

  @override
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.signIn(
        email: email, 
        password: password,
      );
      
      return response;
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
