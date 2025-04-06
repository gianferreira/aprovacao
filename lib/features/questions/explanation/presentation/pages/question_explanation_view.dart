import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/explanation/aprovacao_explanation_text.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scrollable_view.dart';
import 'package:aprovacao/features/questions/feedback/presentation/pages/questions_feedback_page.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:aprovacao/features/questions/question/presentation/pages/question_page.dart';
import 'package:flutter/material.dart';

class QuestionExplanationView extends StatelessWidget {
  const QuestionExplanationView({
    super.key,
    required this.manager,
  });

  final QuestionsManagerEntity manager;

  @override
  Widget build(BuildContext context) {
    return AprovacaoScrollableView(
      appBar: AprovacaoAppBar(
        title: manager.currentQUestion.id,
        hasBackButton: true,
        onBackButtonPressed: () {
          AprovacaoNavigator.pop(context: context);
        },
      ),
      itens: <Widget>[
        AprovacaoExplanationText(
          explanationText: manager.currentQUestion.explanation,
        ),
      ],
      button: AprovacaoFilledButton(
        text: manager.isLastQuestion 
          ? 'Concluir'
          : 'Avançar',
        onPressed: () {
          manager.isLastQuestion 
            ? AprovacaoNavigator.pushReplacement(
                context: context, 
                route: QuestionsFeedbackPage(manager: manager), 
                routeName: Routes.questionsFeedback,
              )
            : AprovacaoNavigator.pushReplacement(
                context: context, 
                route: QuestionPage(
                  manager: manager.copyWith(
                    currentQUestion: manager.nextQuestion,
                  ),
                ), 
                routeName: Routes.questionPage,
              );
        }
      ),
    );
  }
}
