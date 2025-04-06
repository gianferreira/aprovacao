import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_error.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_loading_view.dart';
import 'package:aprovacao/features/modules/explanation/presentation/pages/module_explanation_page.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/questions/manager/presentation/stores/question_controller.dart';
import 'package:aprovacao/features/questions/manager/presentation/stores/questions_state.dart';
import 'package:aprovacao/features/questions/question/presentation/pages/question_page.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/questions/manager/questions_injection_container.dart' as questions_dependencies;

class QuestionsManagerView extends StatefulWidget {
  const QuestionsManagerView({
    super.key,
    required this.module,
    required this.user,
  });

  final ModuleEntity module;
  final UserEntity user;

  @override
  State<QuestionsManagerView> createState() => _QuestionsManagerViewState();
}

class _QuestionsManagerViewState extends State<QuestionsManagerView> {
  late QuestionsController questionsController;

  @override
  void initState() {
    questionsController = questions_dependencies.sl<QuestionsController>();
    questionsController.loadQuestions(
      user: widget.user,
      module: widget.module,
    );

    super.initState();
  }

  @override
  void dispose() {
    questionsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<QuestionsState>(
      valueListenable: questionsController, 
      builder: (context, state, child) {
        if(state is QuestionsSuccess) {
          if(state.manager.module.availablePresentation) {
            return ModuleExplanationPage(
              manager: state.manager,
            );
          } else {
            return QuestionPage(
              manager: state.manager,
            );
          }
        } else if(state is QuestionsLoading) {
          return AprovacaoLoadingView();
        } else {
          AprovacaoSnackBarError.show(
            context: context,
            title: 'Ocorreu um erro, ao tentar carregar as questões do módulo.',
            message: 'Por favor, tente prosseguir em alguns instantes.',
          );
          
          return AprovacaoNavigatorBuilder.pop(context: context);
        }
      },
    );
  }
}
