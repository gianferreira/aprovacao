import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/firebase/authentication/auth_api.dart';

abstract class SignoutDataSource {
  Future<void> logout();
}

class SignoutDataSourceImpl implements SignoutDataSource {
  final AuthAPI api;

  SignoutDataSourceImpl({
    required this.api,
  });

  @override
  Future<void> logout() async {
    try {
      final response = await api.logout();
      
      return response;
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
