import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/report/modules/presentation/pages/modules_report_view.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ModulesReportPage extends StatelessWidget {
  const ModulesReportPage({
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
    return ModulesReportView(
      modules: modules,
      certification: certification,
      user: user,
    );
  }
}
