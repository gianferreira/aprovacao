import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/user/signup/data/models/user_model.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreAPI {
  FirestoreAPI();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<UserEntity> getUser({
    required String userId,
  }) async {
    try {
      List<Map<String, dynamic>> itens = [];

      await db.collection('users').get().then((event) {
        for (var doc in event.docs) {
          itens.add(doc.data());
        }
      });

      final filteredItens = itens.where((element) => element['id'] == userId).toList();

      return UserModel.fromJson(filteredItens.first);
    } catch (err) {
      throw ServerFailure(err.hashCode);
    }
  }

  Future<UserEntity> createUser({
    required UserEntity user,
  }) async {
    try {
      final json = UserModel.toJson(user);

      await db.collection('users').doc(user.id).set(json);

      return user;
    } catch (err) {
      throw ServerFailure(err.hashCode);
    }
  }

  Future<CertificationsSnapshots> getCertifications({
    required String userId,
  }) async {
    try {
      final userCertificationsSnaps = await db
        .collection('users_certifications')
        .where('user_id', isEqualTo: userId)
        .get();

      final userCertificationsIds = userCertificationsSnaps.docs.map(
        (document) => document['certification_id'].toString(),
      ).toList();

      final certificationsSnaps = await db
        .collection('certifications')
        .where('id', whereIn: userCertificationsIds)
        .get();

      final userCertifications = userCertificationsSnaps.docs.map(
        (document) => document.data()
      ).toList();

      final certifications = certificationsSnaps.docs.map(
        (document) => document.data()
      ).toList();

      CertificationsSnapshots snapshots = (
        userCertifications: userCertifications, 
        certifications: certifications,
      );

      return snapshots;
    } catch (err) {
      throw ServerFailure(err.hashCode);
    }
  }
}
