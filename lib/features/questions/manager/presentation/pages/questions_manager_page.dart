import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scaffold_view.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class QuestionsManagerPage extends StatelessWidget {
  const QuestionsManagerPage({
    super.key,
    required this.module,
    required this.certification,
    required this.user,
    required this.revision,
  });

  final ModuleEntity module;
  final CertificationEntity certification;
  final UserEntity user;
  final bool revision;

  @override
  Widget build(BuildContext context) {
    return AprovacaoScaffoldView(
      appBar: AprovacaoAppBar(
        title: 'Gerencianado as questõess',
        hasBackButton: true,
        onBackButtonPressed: () {
          AprovacaoNavigator.pop(context: context);
        },
      ), 
      body: Container(),
    );
  }
}
