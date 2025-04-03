import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/contributions/list/data/models/contributions_model.dart';
import 'package:aprovacao/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:aprovacao/features/user/signup/data/models/user_model.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreAPI {
  FirestoreAPI();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getBiomes() async {
    try {
      List<Map<String, dynamic>> itens = [];

      await db.collection('biomes').get().then((event) {
        for (var doc in event.docs) {
          itens.add(doc.data());
        }
      });

      return itens;
    } catch (err) {
      throw ServerFailure(err.hashCode);
    }
  }

  Future<List<Map<String, dynamic>>> getContributionsFromBiome({
    required String biomeId,
  }) async {
    try {
      List<Map<String, dynamic>> itens = [];

      final event = await db.collection('contributions')
        .where('biomeId', isEqualTo: biomeId)
        .get();
      
      for (var doc in event.docs) {
        itens.add(doc.data());
      }

      return itens;
    } catch (err) {
      throw ServerFailure(err.hashCode);
    }
  }

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

  Future<ContributionEntity> createContribution({
    required ContributionEntity contribution,
  }) async {
    try {
      final json = ContributionModel.toJson(contribution);

      await db.collection('contributions').doc(contribution.id).set(json);

      return contribution;
    } catch (err) {
      throw ServerFailure(err.hashCode);
    }
  }
}
