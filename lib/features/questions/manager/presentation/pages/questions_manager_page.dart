import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/questions/manager/presentation/pages/questions_manager_view.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class QuestionsManagerPage extends StatelessWidget {
  const QuestionsManagerPage({
    super.key,
    required this.user,
    required this.module,
    required this.certification,
  });

  final UserEntity user;
  final ModuleEntity module;
  final CertificationEntity certification;

  @override
  Widget build(BuildContext context) {
    return QuestionsManagerView(
      module: module, 
      user: user,
      certification: certification,
    );
  }
}
