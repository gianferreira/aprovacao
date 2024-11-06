import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/core/firebase/firestore/firestore_api.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';

abstract class UserDataSource {
  Future<UserEntity> createUser({
    required String id,
    required String email,
    required String name,
  });

  Future<UserEntity> getUser({
    required String id,
  });
}

class UserDataSourceImpl implements UserDataSource {
  final FirestoreAPI api;

  UserDataSourceImpl({
    required this.api,
  });

  @override
  Future<UserEntity> createUser({
    required String id,
    required String email,
    required String name,
  }) async {
    try {
      final response = await api.createUser(
        user: UserEntity(
          id: id, 
          name: name, 
          email: email,
        ),
      );
      
      return response;
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }

  @override
  Future<UserEntity> getUser({
    required String id,
  }) async {
    try {
      final response = await api.getUser(
        userId: id,
      );
      
      return response;
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
