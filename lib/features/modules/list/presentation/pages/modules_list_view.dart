import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scaffold_view.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/modules/list/presentation/widgets/module_item.dart';
import 'package:aprovacao/features/modules/list/presentation/widgets/module_separator.dart';
import 'package:aprovacao/features/modules/list/presentation/widgets/modules_instructions.dart';
import 'package:aprovacao/features/questions/manager/presentation/pages/questions_manager_page.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

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

    return AprovacaoScaffoldView(
      appBar: AprovacaoAppBar(
        title: certification.title,
        hasBackButton: true,
        onBackButtonPressed: () {
          AprovacaoNavigator.pop(context: context);
        },
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[ 
            ModulesInstructions(
              isFirstModule: currentModule == modules.first,
              isLastModule: currentModule == modules.last,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
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
        ),
      ),
      bottom: currentModule == modules.last
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
                  certification: certification,
                  user: user,
                  revision: false,
                ),
                routeName: Routes.questionsManager,
              );
            },
          ),
    );
  }
}
