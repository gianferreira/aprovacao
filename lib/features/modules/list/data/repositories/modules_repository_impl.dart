import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/features/modules/list/data/datasources/modules_data_source.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/modules/list/domain/repositories/modules_repository.dart';
import 'package:dartz/dartz.dart';

class ModulesRepositoryImpl implements ModulesRepository {
  final ModulesDataSource dataSource;

  ModulesRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<ModuleEntity>>> loadModules({
    required String userId,
    required String certificationId,
  }) async {
    try {
      final result = await dataSource.loadModules(
        userId: userId,
        certificationId: certificationId,
      );

      return Right(result);
    } on ServerFailureWithMessage catch (error) {
      return Left(
        ServerFailureWithMessage(error.code, error.message),
      );
    } on ServerFailure catch (error) {
      return Left(
        ServerFailure(error.code),
      );
    }
  }
}
