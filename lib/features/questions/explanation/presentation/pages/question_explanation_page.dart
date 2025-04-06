import 'package:aprovacao/features/questions/explanation/presentation/pages/question_explanation_view.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:flutter/material.dart';

class QuestionExplanationPage extends StatelessWidget {
  const QuestionExplanationPage({
    super.key,
    required this.manager,
  });

  final QuestionsManagerEntity manager;

  @override
  Widget build(BuildContext context) {
    return QuestionExplanationView(manager: manager);
  }
}
