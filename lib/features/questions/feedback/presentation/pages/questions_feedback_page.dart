import 'package:aprovacao/features/questions/feedback/presentation/pages/questions_feedback_view.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:flutter/material.dart';

class QuestionsFeedbackPage extends StatelessWidget {
  const QuestionsFeedbackPage({
    super.key,
    required this.manager,
  });

  final QuestionsManagerEntity manager;

  @override
  Widget build(BuildContext context) {
    return QuestionsFeedbackView(manager: manager);
  }
}
