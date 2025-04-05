import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/arch/use_case/use_case.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/modules/list/domain/repositories/modules_repository.dart';
import 'package:dartz/dartz.dart';

class LoadModulesUsecase implements UseCase<List<ModuleEntity>, LoadModulesParams> {
  final ModulesRepository repository;

  LoadModulesUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, List<ModuleEntity>>> call(
    LoadModulesParams params,
  ) async {
    final loadModulesResult = await repository.loadModules(
      userId: params.userId,
      certificationId: params.certificationId,
    );

    return loadModulesResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar carregar os módulos, tente novamente.',
              ),
        );
      },
      (success) {
        return Right(success);
      },
    );
  }
}

class LoadModulesParams {
  final String userId;
  final String certificationId;

  LoadModulesParams({
    required this.userId,
    required this.certificationId,
  });
}
