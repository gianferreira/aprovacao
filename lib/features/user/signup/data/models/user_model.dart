import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String? id,
    required String? email,
    required String? name,
  }) : super(
    id: id ?? '',
    email: email ?? '',
    name: name ?? '',
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }

  static Map<String, dynamic> toJson(UserEntity user) {
    return {
      'id': user.id,
      'name': user.name,
      'email': user.email,
    };
  }
}
