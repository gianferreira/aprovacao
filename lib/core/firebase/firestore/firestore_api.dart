import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/data/models/module_model.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/questions/manager/data/models/group_model.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/group_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
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

  Future<ModulesSnapshots> getModules({
    required String userId,
    required String certificationId,
  }) async {
    try {
      final modulesSnaps = await db
        .collection('modules')
        .where('certification_id', isEqualTo: certificationId)
        .get();

      final modulesIds = modulesSnaps.docs.map(
        (document) => document['id'].toString(),
      ).toList();

      final userModulesSnaps = await db
        .collection('users_modules')
        .where('user_id', isEqualTo: userId)
        .where('module_id', whereIn: modulesIds)
        .get();

      final userModules = userModulesSnaps.docs.map(
        (document) => document.data()
      ).toList();

      final modules = modulesSnaps.docs.map(
        (document) => document.data()
      ).toList();

      ModulesSnapshots snapshots = (
        userModules: userModules, 
        modules: modules,
      );

      return snapshots;
    } catch (err) {
      throw ServerFailure(err.hashCode);
    }
  }

  Future<QuestionsGroupsSnapshots> getQuestions({
    required String userId,
    required String moduleId,
  }) async {
    try {
      final groupsSnaps = await db
        .collection('groups')
        .where('module_id', isEqualTo: moduleId)
        .get();

      final groupsIds = groupsSnaps.docs.map(
        (document) => document['id'].toString(),
      ).toList();

      final userGroupsSnaps = await db
        .collection('users_groups')
        .where('user_id', isEqualTo: userId)
        .where('group_id', whereIn: groupsIds)
        .get();

      final userGroups = userGroupsSnaps.docs.map(
        (document) => document.data()
      ).toList();

      userGroups.sort(
        (a, b) => (
          a['nextRevisionDate'] as Timestamp
        ).compareTo(
          b['nextRevisionDate'] as Timestamp,
        ),
      );

      final groupId = userGroups.first['group_id'].toString();

      final questionSnaps = await db
        .collection('questions')
        .where('group_id', isEqualTo: groupId)
        .get();

      final questions = questionSnaps.docs.map(
        (document) => document.data()
      ).toList();

      QuestionsGroupsSnapshots snapshots = (
        questions: questions, 
        group: userGroups.first,
      );

      return snapshots;
    } catch (err) {
      throw ServerFailure(err.hashCode);
    }
  }

  Future<bool> sendQuestionsInfo({
    required QuestionsManagerEntity manager,
  }) async {
    try {
      final updatedUserGroupJson = GroupModel.toJson(
        entity: manager.group, 
        userId: manager.user.id,
      );

      await db.collection('users_groups').doc(
        manager.group.userGroupId,
      ).set(updatedUserGroupJson);

      final groupsSnaps = await db
        .collection('groups')
        .where('module_id', isEqualTo: manager.module.id)
        .get();

      final groupsIds = groupsSnaps.docs.map(
        (document) => document['id'].toString(),
      ).toList();

      final userGroupsSnaps = await db
        .collection('users_groups')
        .where('user_id', isEqualTo: manager.user.id)
        .where('group_id', whereIn: groupsIds)
        .where('timesAnswered', isEqualTo: 0)
        .get();

      final availableRevision = userGroupsSnaps.docs.isEmpty;

      final updatedUserModuleJson = ModuleModel.toJson(
        userId: manager.user.id,
        moduleId: manager.module.id,
        userModuleId: manager.module.userModuleId,
        availablePresentation: false,
        availableRevision: availableRevision,
      );

      await db.collection('users_modules').doc(
        manager.module.userModuleId,
      ).set(updatedUserModuleJson);

      return true;
    } catch (err) {
      throw ServerFailure(err.hashCode);
    }
  }
}
