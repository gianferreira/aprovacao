import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/explanation/aprovacao_explanation_text.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scrollable_view.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:aprovacao/features/questions/question/presentation/pages/question_page.dart';
import 'package:flutter/material.dart';

class ModuleExplanationView extends StatelessWidget {
  const ModuleExplanationView({
    super.key,
    required this.manager,
  });

  final QuestionsManagerEntity manager;

  @override
  Widget build(BuildContext context) {
    return AprovacaoScrollableView(
      appBar: AprovacaoAppBar(
        title: 'Apresentação',
        onBackButtonPressed: () {
          AprovacaoNavigator.pop(context: context);
        },
      ),
      itens: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24.0,
              bottom: 8.0,
            ),
            child: Text(
              'Bem-vindo ao módulo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MyriadProRegular',
                height: 1.2,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4F4F4F),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            manager.module.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 26.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF02CEFD),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
          ),
          child: Icon(
            Icons.rocket_launch_outlined,
            color: Color(0xFF02CEFD),
            size: 80.0,
          ),
        ),
        AprovacaoExplanationText(
          explanationText: manager.module.explanation,
          titleColor: Color(0xFF02CEFD),
        ),
      ],
      button: AprovacaoFilledButton(
        text: 'Ir para as questões',
        onPressed: () {
          AprovacaoNavigator.pushReplacement(
            context: context, 
            route: QuestionPage(manager: manager), 
            routeName: Routes.questionPage,
          );
        }
      ),
    );
  }
}
