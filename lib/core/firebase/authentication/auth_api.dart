import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthAPI {
  AuthAPI();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );

      return result;
    } catch(err) {
      throw ServerFailure(err.hashCode);
    }
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );

      return result;
    } catch(err) {
      throw ServerFailure(err.hashCode);
    }
  }

  Future<void> logout() async {
    try {
      return await auth.signOut();
    } catch(err) {
      throw ServerFailure(err.hashCode);
    }
  }
}
