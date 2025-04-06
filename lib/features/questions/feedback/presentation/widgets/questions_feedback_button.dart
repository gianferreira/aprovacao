import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_error.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_success.dart';
import 'package:aprovacao/features/modules/list/presentation/pages/modules_list_page.dart';
import 'package:aprovacao/features/questions/feedback/presentation/stores/feedback_controller.dart';
import 'package:aprovacao/features/questions/feedback/presentation/stores/feedback_state.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:flutter/material.dart';

class QuestionsFeedbackButton extends StatelessWidget {
  const QuestionsFeedbackButton({
    super.key,
    required this.manager,
    required this.feedbackController,
    required this.difficultyController,
  });

  final QuestionsManagerEntity manager;
  final FeedbackController feedbackController;
  final ValueNotifier<int> difficultyController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<FeedbackState>(
      valueListenable: feedbackController,
      builder: (context, state, child) {
        if(state is FeedbackSuccess) {
          manager.questions.forEach((element) { 
            AprovacaoNavigatorBuilder.pop(context: context);
          });

          AprovacaoNavigatorBuilder.pop(context: context);
          AprovacaoNavigatorBuilder.pushReplacement(
            context: context, 
            route: ModulesListPage(
              user: manager.user, 
              certification: manager.certification,
            ),
            routeName: Routes.modulesList,
          );

          AprovacaoSnackBarSuccess.show(
            context: context,
            title: 'Questões e feedback enviados com sucesso!',
            message: 'Próxima revisão deste grupo em ${state.updatedRevisionTime} dias.'
          );
        } else if (state is FeedbackError) {
          AprovacaoSnackBarError.show(
            context: context,
            title: state.errorMessage,
            message: 'Por favor, tente prosseguir em alguns instantes',
          );
        }

        return AprovacaoFilledButton(
          text: 'Enviar dados',
          isLoading: state is FeedbackLoading,
          onPressed: () {
            feedbackController.sendFeedback(
              manager: manager.copyWith(
                difficulty: difficultyController.value,
              ),
            );
          },
        );
      }
    );
  }
}
