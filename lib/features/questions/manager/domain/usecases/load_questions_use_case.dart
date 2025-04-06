import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/arch/use_case/use_case.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/repositories/questions_repository.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class LoadQuestionsUsecase implements UseCase<QuestionsManagerEntity, LoadQuestionsParams> {
  final QuestionsRepository repository;

  LoadQuestionsUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, QuestionsManagerEntity>> call(
    LoadQuestionsParams params,
  ) async {
    final loadQuestionsResult = await repository.loadQuestions(
      userId: params.user.id,
      moduleId: params.module.id,
    );

    return loadQuestionsResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar carregar as questões, tente novamente.',
              ),
        );
      },
      (success) {
        final manager = QuestionsManagerEntity(
          group: success, 
          module: params.module,
          certification: params.certification, 
          user: params.user, 
          difficulty: 1, 
          corrects: 0,
          currentQUestion: success.questions.first,
        );

        return Right(manager);
      },
    );
  }
}

class LoadQuestionsParams {
  final UserEntity user;
  final ModuleEntity module;
  final CertificationEntity certification;

  LoadQuestionsParams({
    required this.user,
    required this.module,
    required this.certification,
  });
}
