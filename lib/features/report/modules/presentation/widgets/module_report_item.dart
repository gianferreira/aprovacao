import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/report/groups/presentation/pages/groups_report_page.dart';
import 'package:aprovacao/features/report/modules/presentation/widgets/module_report_button.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ModuleReportItem extends StatelessWidget {
  const ModuleReportItem({
    Key? key,
    required this.itemModule,
    required this.currentModule,
    required this.certification,
    required this.user,
  }) : super(key: key);

  final ModuleEntity itemModule;
  final ModuleEntity currentModule;
  final CertificationEntity certification;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 36.0,
          width: 36.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: itemModule.sequenceId > currentModule.sequenceId
              ? Color(0xFFE3E3E3)
              : Color(0xFF0075FF),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Text(
            itemModule.title,
            style: itemModule.sequenceId > currentModule.sequenceId
              ? TextStyle(
                  fontFamily: 'MyriadProRegular',
                  height: 1.2,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF5F5F5F),
                )
              : itemModule.sequenceId == currentModule.sequenceId
                ? TextStyle(
                    fontFamily: 'MyriadProRegular',
                    height: 1.2,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0075FF),
                  )  
                : TextStyle(
                    fontFamily: 'MyriadProRegular',
                    height: 1.2,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0B1C40),
                  ),
          ),
        ),
        Visibility(
          visible: itemModule.availableRevision,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ModuleReportButton(
              onPressed: () {
                AprovacaoNavigator.push(
                  context: context,
                  route: GroupsReportPage(
                    module: itemModule, 
                    user: user, 
                    certification: certification,
                  ),
                  routeName: Routes.questionsManager,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
