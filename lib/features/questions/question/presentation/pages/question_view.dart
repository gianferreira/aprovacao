import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/searchable/aprovacao_searchable_view.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scaffold_view.dart';
import 'package:aprovacao/core/widgets/warning/aprovacao_exit_sheet.dart';
import 'package:aprovacao/features/questions/explanation/presentation/pages/question_explanation_page.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/question_entity.dart';
import 'package:flutter/material.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({
    super.key,
    required this.manager,
  });

  final QuestionsManagerEntity manager;

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  late ValueNotifier<String> selectedOptionController;
  late TextEditingController searchTextController;

  @override
  void initState() {
    selectedOptionController = ValueNotifier('');
    searchTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    selectedOptionController.dispose();
    searchTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AprovacaoScaffoldView(
      appBar: AprovacaoAppBar(
        title: widget.manager.currentQUestion.questionLabel,
        hasBackButton: widget.manager.isFirstQuestion == false,
        onBackButtonPressed: () {
          AprovacaoNavigator.pop(context: context);
        },
        customLeading: widget.manager.isFirstQuestion
          ? AprovacaoExitBottomSheet()
          : SizedBox.shrink(),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: AprovacaoSearchableView(
              listLabel: widget.manager.currentQUestion.description,
              searchableItens: widget.manager.currentQUestion.options,
              selectedItemController: selectedOptionController,
              searchLabel: 'Buscar alguma palavra-chave',
              searchTextController: searchTextController,
            ),
          ),
        ],
      ),
      bottom: ValueListenableBuilder<String>(
        valueListenable: selectedOptionController,
        builder: (context, option, child) {
          return AprovacaoFilledButton(
            text: 'Avançar',
            isDisable: option.isEmpty,
            onPressed: () {
              QuestionsManagerEntity manager = widget.manager; 

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
            },
          );
        }
      ),
    );
  }
}
