import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_filled_button.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scrollable_view.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/report/modules/presentation/widgets/module_report_instructions.dart';
import 'package:aprovacao/features/report/modules/presentation/widgets/module_report_item.dart';
import 'package:aprovacao/features/report/modules/presentation/widgets/module_report_separator.dart';
import 'package:aprovacao/features/reset/presentation/widgets/reset_progress_button.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ModulesReportView extends StatelessWidget {
  const ModulesReportView({
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
        ModuleReportInstructions(),
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
              return ModuleReportSeparator(
                itemModule: modules[index],
                currentModule: currentModule,
              );
            },
            itemBuilder: (context, index) {
              return ModuleReportItem(
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
            child: ResetProgressButton(),
          ),
          AprovacaoFilledButton(
            text: 'Voltar',
            onPressed: () {
              AprovacaoNavigator.pop(context: context);
            },
          ),
        ]
      ),
    );
  }
}
