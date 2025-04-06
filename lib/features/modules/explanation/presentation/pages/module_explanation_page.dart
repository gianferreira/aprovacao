import 'package:aprovacao/features/modules/explanation/presentation/pages/module_explanation_view.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:flutter/material.dart';

class ModuleExplanationPage extends StatelessWidget {
  const ModuleExplanationPage({
    super.key,
    required this.manager,
  });

  final QuestionsManagerEntity manager;

  @override
  Widget build(BuildContext context) {
    return ModuleExplanationView(manager: manager);
  }
}
