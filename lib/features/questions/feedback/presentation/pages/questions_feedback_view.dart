import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scrollable_view.dart';
import 'package:aprovacao/features/questions/feedback/domain/usecases/questions_feedback_difficulty_enum.dart';
import 'package:aprovacao/features/questions/feedback/presentation/stores/feedback_controller.dart';
import 'package:aprovacao/features/questions/feedback/presentation/widgets/questions_feedback_button.dart';
import 'package:aprovacao/features/questions/feedback/presentation/widgets/questions_feedback_difficulty.dart';
import 'package:aprovacao/features/questions/feedback/presentation/widgets/questions_feedback_header.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/questions/feedback/feedback_injection_container.dart' as feedback_dependencies;

class QuestionsFeedbackView extends StatefulWidget {
  const QuestionsFeedbackView({
    super.key,
    required this.manager,
  });

  final QuestionsManagerEntity manager;

  @override
  State<QuestionsFeedbackView> createState() => _QuestionsFeedbackViewState();
}

class _QuestionsFeedbackViewState extends State<QuestionsFeedbackView> {
  late FeedbackController feedbackController;
  late ValueNotifier<int> difficultyController;

  @override
  void initState() {
    feedbackController = feedback_dependencies.sl<FeedbackController>();
    difficultyController = ValueNotifier(QuestionsFeedbackEnum.Easy.level);

    super.initState();
  }

  @override
  void dispose() {
    feedbackController.dispose();
    difficultyController.dispose();

    super.dispose();
  }

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
        QuestionsFeedbackHeader(
          manager: widget.manager,
        ),
        QuestionsFeedbackDifficulty(
          difficulty: QuestionsFeedbackEnum.Easy,
        ),
        QuestionsFeedbackDifficulty(
          difficulty: QuestionsFeedbackEnum.Moderate,
        ),
        QuestionsFeedbackDifficulty(
          difficulty: QuestionsFeedbackEnum.Complex,
        ),
        QuestionsFeedbackDifficulty(
          difficulty: QuestionsFeedbackEnum.Hard,
        ),
      ],
      button: QuestionsFeedbackButton(
        manager: widget.manager,
        feedbackController: feedbackController,
        difficultyController: difficultyController,
      ),
    );
  }
}
