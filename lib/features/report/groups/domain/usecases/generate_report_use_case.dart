import 'package:aprovacao/core/arch/failures/failures.dart';
import 'package:aprovacao/core/arch/use_case/use_case.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/report/groups/domain/entities/module_report_entity.dart';
import 'package:aprovacao/features/report/groups/domain/repositories/report_repository.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class GenerateReportUsecase implements UseCase<ModuleReportEntity, GenerateReportParams> {
  final ReportRepository repository;

  GenerateReportUsecase(this.repository);

  @override
  Future<Either<ServerFailureWithMessage, ModuleReportEntity>> call(
    GenerateReportParams params,
  ) async {
    final generateReportResult = await repository.generateReport(
      userId: params.user.id,
      moduleId: params.module.id,
    );

    return generateReportResult.fold(
      (failure) {
        return Left(
          failure is ServerFailureWithMessage
            ? failure
            : ServerFailureWithMessage(
                failure.hashCode,
                'Ocorreu um problema ao tentar gerar o relatório.',
              ),
        );
      },
      (success) {
        int timesAnswered = 0;
        int totalAnswers = 0;
        int correctAnswers = 0;
        int answerRating = 0;

        success.forEach((element) { 
          timesAnswered = timesAnswered + element.timesAnswered;
          totalAnswers = totalAnswers + element.totalAnswers;
          correctAnswers = correctAnswers + element.correctAnswers;
        });

        answerRating = correctAnswers > 0 && totalAnswers > 0
          ? (correctAnswers / totalAnswers * 100).toInt()
          : 0;

        ModuleReportEntity report = ModuleReportEntity(
          timesAnswered: timesAnswered,
          totalAnswers: totalAnswers ,
          correctAnswers: correctAnswers,
          answerRating: answerRating,
          groups: success,
        );

        return Right(report);
      },
    );
  }
}

class GenerateReportParams {
  final UserEntity user;
  final ModuleEntity module;

  GenerateReportParams({
    required this.user,
    required this.module,
  });
}
