import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ModulesRepository {
  Future<Either<Failure, List<ModuleEntity>>> loadModules({
    required String userId,
    required String certificationId,
  });
}
