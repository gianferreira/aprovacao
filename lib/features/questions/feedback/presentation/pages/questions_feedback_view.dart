import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scrollable_view.dart';
import 'package:aprovacao/features/questions/feedback/domain/usecases/questions_feedback_difficulty_enum.dart';
import 'package:aprovacao/features/questions/feedback/presentation/widgets/questions_feedback_difficulty.dart';
import 'package:aprovacao/features/questions/feedback/presentation/widgets/questions_feedback_header.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:flutter/material.dart';

class QuestionsFeedbackView extends StatelessWidget {
  const QuestionsFeedbackView({
    super.key,
    required this.manager,
  });

  final QuestionsManagerEntity manager;

  @override
  Widget build(BuildContext context) {
    return AprovacaoScrollableView(
      appBar: AprovacaoAppBar(
        title: 'Classificação',
        onBackButtonPressed: () {
          AprovacaoNavigator.pop(context: context);
        },
      ),
      itens: <Widget>[
        QuestionsFeedbackHeader(),
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
          ),
          child: Text(
            'Classifique a dificuldade das questões anteriores:',
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF101010),
            ),
          ),
        ),
        QuestionsFeedbackDifficulty(
          difficulty: QuestionsFeedbackDifficultyEnum.Easy,
        ),
        QuestionsFeedbackDifficulty(
          difficulty: QuestionsFeedbackDifficultyEnum.Moderate,
        ),
        QuestionsFeedbackDifficulty(
          difficulty: QuestionsFeedbackDifficultyEnum.Complex,
        ),
        QuestionsFeedbackDifficulty(
          difficulty: QuestionsFeedbackDifficultyEnum.Hard,
        ),
      ],
      button: AprovacaoFilledButton(
        text: 'Enviar dados',
        onPressed: () {},
      ),
    );
  }
}
