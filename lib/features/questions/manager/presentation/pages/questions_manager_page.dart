import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/questions/manager/presentation/pages/questions_manager_view.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class QuestionsManagerPage extends StatelessWidget {
  const QuestionsManagerPage({
    super.key,
    required this.module,
    required this.user,
  });

  final ModuleEntity module;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return QuestionsManagerView(
      module: module, 
      user: user,
    );
  }
}
