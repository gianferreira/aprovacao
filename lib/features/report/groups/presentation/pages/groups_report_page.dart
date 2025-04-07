import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/report/groups/domain/entities/group_report_entity.dart';
import 'package:aprovacao/features/report/groups/domain/entities/module_report_entity.dart';
import 'package:aprovacao/features/report/groups/presentation/pages/groups_report_view.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class GroupsReportPage extends StatelessWidget {
  const GroupsReportPage({
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
    return GroupsReportView(
      module: module,
      moduleReport: ModuleReportEntity(
        totalAnswers: 200,
        answerRating: 72,
        correctAnswers: 144,
        timesAnswered: 50,
        groups: <GroupReportEntity>[
          GroupReportEntity(
            nextRevisionDate: DateTime.now().add(Duration(days: 3)), 
            revisionTime: 4, 
            timesAnswered: 26, 
            totalAnswers: 104, 
            correctAnswers: 72, 
            answerRating: 70,
          ),
          GroupReportEntity(
            nextRevisionDate: DateTime.now().add(Duration(days: 5)), 
            revisionTime: 6, 
            timesAnswered: 24, 
            totalAnswers: 96, 
            correctAnswers: 72, 
            answerRating: 74,
          ),
        ],
      ), 
    );
  }
}
