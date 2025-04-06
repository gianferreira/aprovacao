import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({
    super.key,
    required this.manager,
  });

  final QuestionsManagerEntity manager;

  @override
  Widget build(BuildContext context) {
    return QuestionPage(manager: manager);
  }
}
