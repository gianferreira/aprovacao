import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/firebase/firestore/firestore_api.dart';
import 'package:aprovacao/features/modules/list/data/models/module_model.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';

abstract class ModulesDataSource {
  Future<List<ModuleEntity>> loadModules({
    required String userId,
    required String certificationId,
  });
}

class ModulesDataSourceImpl implements ModulesDataSource {
  final FirestoreAPI api;

  ModulesDataSourceImpl({
    required this.api,
  });

  @override
  Future<List<ModuleEntity>> loadModules({
    required String userId,
    required String certificationId,
  }) async {
    try {
      final response = await api.getModules(
        userId: userId,
        certificationId: certificationId,
      );
      
      return ModuleModel.fromDataBase(
        snapshots: response,
      );
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
