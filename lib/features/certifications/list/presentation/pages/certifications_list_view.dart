import 'package:aprovacao/core/widgets/structure/aprovacao_app_bar.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_scaffold_view.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/certifications/list/presentation/widgets/certification_item.dart';
import 'package:aprovacao/features/user/signout/presentation/widgets/signout_handler.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class CertificationsListView extends StatelessWidget {
  const CertificationsListView({
    super.key,
    required this.certifications,
    required this.user,
  });

  final List<CertificationEntity> certifications;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return AprovacaoScaffoldView(
      appBar: AprovacaoAppBar(
        title: 'Meus Estudos',
        hasBackButton: false,
        onBackButtonPressed: () {},
        customLeading: SignoutHandler(),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: certifications.length,
              itemBuilder: (context, index) {
                return CertificationItem(
                  certification: certifications[index],
                  user: user,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
