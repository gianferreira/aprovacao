import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_tonal_button.dart';
import 'package:aprovacao/features/questions/explanation/presentation/pages/question_explanation_page.dart';
import 'package:aprovacao/features/questions/feedback/presentation/pages/questions_feedback_page.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:aprovacao/features/questions/question/presentation/pages/question_page.dart';
import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton({
    super.key,
    required this.option,
    required this.manager,
  });

  final String option;
  final QuestionsManagerEntity manager;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
          visible: option.isNotEmpty,
          child: AprovacaoTonalButton(
          text: manager.isLastQuestion 
            ? 'Concluir'
            : 'Avançar',
            onPressed: () {
              manager.isLastQuestion 
                ? AprovacaoNavigator.push(
                    context: context, 
                    route: QuestionsFeedbackPage(
                      manager: manager.copyWith(
                        corrects: option == manager.currentQUestion.correctAnswer
                          ? manager.corrects + 1
                          : manager.corrects,
                      ),
                    ), 
                    routeName: Routes.questionsFeedback,
                  )
                : AprovacaoNavigator.push(
                    context: context, 
                    route: QuestionPage(
                      manager: manager.copyWith(
                        currentQUestion: manager.nextQuestion,
                        corrects: option == manager.currentQUestion.correctAnswer
                          ? manager.corrects + 1
                          : manager.corrects,
                      ),
                    ), 
                    routeName: Routes.questionPage,
                  );
            }
          ),
        ),
        AprovacaoFilledButton(
          text: 'Verificar correção',
          isDisable: option.isEmpty,
          onPressed: () {
            AprovacaoNavigatorBuilder.push(
              context: context, 
              route: QuestionExplanationPage(
                manager: manager.copyWith(
                  corrects: option == manager.currentQUestion.correctAnswer
                    ? manager.corrects + 1
                    : manager.corrects,
                ),
              ), 
              routeName: Routes.questionExplanation
            );
          }
        ),
      ],
    );
  }
}
