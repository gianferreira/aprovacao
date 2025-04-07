import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_tonal_button.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scrollable_view.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/modules/list/presentation/widgets/module_item.dart';
import 'package:aprovacao/features/modules/list/presentation/widgets/module_separator.dart';
import 'package:aprovacao/features/modules/list/presentation/widgets/modules_instructions.dart';
import 'package:aprovacao/features/questions/manager/presentation/pages/questions_manager_page.dart';
import 'package:aprovacao/features/report/modules/presentation/pages/modules_report_page.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ModulesListView extends StatelessWidget {
  const ModulesListView({
    super.key,
    required this.modules,
    required this.certification,
    required this.user,
  });

  final List<ModuleEntity> modules;
  final CertificationEntity certification;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final currentModule = modules.currentModule;

    return AprovacaoScrollableView(
      appBar: AprovacaoAppBar(
        title: certification.title,
        hasBackButton: true,
        onBackButtonPressed: () {
          AprovacaoNavigator.pop(context: context);
        },
      ),
      itens: <Widget>[ 
        ModulesInstructions(
          isFirstModule: currentModule == modules.first && modules.first.availablePresentation,
          isLastModule: currentModule == modules.last,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: modules.length,
            separatorBuilder: (context, index) {
              return ModuleSeparator(
                itemModule: modules[index],
                currentModule: currentModule,
              );
            },
            itemBuilder: (context, index) {
              return ModuleItem(
                itemModule: modules[index],
                currentModule: currentModule,
                certification: certification,
                user: user,
              );
            },
          ),
        ),
      ],
      twoButtons: currentModule != modules.first,
      button: Column(
        children: <Widget>[
          Visibility(
            visible: currentModule != modules.first,
            child: AprovacaoTonalButton(
              text: 'Relatório de Progresso', 
              onPressed: () {
                AprovacaoNavigator.push(
                  context: context, 
                  route: ModulesReportPage(
                    modules: modules, 
                    certification: certification, 
                    user: user,
                  ), 
                  routeName: Routes.modulesReport,
                );
              }
            ),
          ),
          currentModule == modules.last
            ? AprovacaoFilledButton(
                text: 'Concluir estudos',
                onPressed: () {
                  AprovacaoNavigator.pop(context: context);
                },
              )
            : AprovacaoFilledButton(
                text: currentModule == modules.first && currentModule.availablePresentation
                  ? 'Iniciar estudos'
                  : 'Continuar estudos',
                onPressed: () {
                  AprovacaoNavigator.push(
                    context: context,
                    route: QuestionsManagerPage(
                      module: currentModule,
                      user: user,
                      certification: certification,
                    ),
                    routeName: Routes.questionsManager,
                  );
                },
              ),
        ]
      ),
    );
  }
}
