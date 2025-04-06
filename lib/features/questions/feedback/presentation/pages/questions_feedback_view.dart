import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scrollable_view.dart';
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
      itens: <Widget>[],
      button: AprovacaoFilledButton(
        text: 'Enviar dados',
        onPressed: () {},
      ),
    );
  }
}
