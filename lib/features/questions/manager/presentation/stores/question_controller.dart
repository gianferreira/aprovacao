import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/usecases/load_questions_use_case.dart';
import 'package:aprovacao/features/questions/manager/presentation/stores/questions_state.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class QuestionsController extends ValueNotifier<QuestionsState> {
  QuestionsController({
    required this.usecase,
  }) : super(QuestionsEmpty());

  final LoadQuestionsUsecase usecase;

  void loadQuestions({
    required UserEntity user,
    required ModuleEntity module,
    required CertificationEntity certification,
  }) async {
    value = QuestionsLoading();

    final loadQuestionsResult = await usecase(LoadQuestionsParams(
      user: user,
      module: module,
      certification: certification,
    ));

    loadQuestionsResult.fold(
      (failure) {
        value = QuestionsError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = QuestionsSuccess(
          manager: success,
        );
      },
    );
  }
}
