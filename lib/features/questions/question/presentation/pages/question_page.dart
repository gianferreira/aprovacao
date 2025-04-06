import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:aprovacao/features/questions/question/presentation/pages/question_view.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({
    super.key,
    required this.manager,
  });

  final QuestionsManagerEntity manager;

  @override
  Widget build(BuildContext context) {
    return QuestionView(manager: manager);
  }
}
