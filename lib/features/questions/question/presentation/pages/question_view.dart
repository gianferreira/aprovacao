import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/widgets/searchable/aprovacao_searchable_view.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scaffold_view.dart';
import 'package:aprovacao/core/widgets/warning/aprovacao_exit_sheet.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/question_entity.dart';
import 'package:aprovacao/features/questions/question/presentation/widgets/question_button.dart';
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
    QuestionsManagerEntity manager = widget.manager; 

    return ValueListenableBuilder<String>(
      valueListenable: selectedOptionController,
      builder: (context, option, child) {
        return AprovacaoScaffoldView(
          appBar: AprovacaoAppBar(
            title: manager.currentQUestion.questionLabel,
            hasBackButton: manager.isFirstQuestion == false,
            onBackButtonPressed: () {
              AprovacaoNavigator.pop(context: context);
            },
            customLeading: manager.isFirstQuestion
              ? AprovacaoExitBottomSheet()
              : SizedBox.shrink(),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: AprovacaoSearchableView(
                  listLabel: manager.currentQUestion.description,
                  searchableItens: manager.currentQUestion.options,
                  selectedItemController: selectedOptionController,
                  searchLabel: 'Buscar alguma palavra-chave',
                  searchTextController: searchTextController,
                ),
              ),
            ],
          ),
          twoButtons: option.isNotEmpty,
          button: QuestionButton(
            manager: manager,
            option: option,
          ),
        );
      }
    );
  }
}
