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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: const SignoutHandler(),
        elevation: 0.0,
        title: const Text(
          'Meus Estudos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.white,
            fontFamily: 'MyriadProRegular',
          ),
        ),
      ),
      body: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: certifications.length,
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Divider(
              thickness: 0.5,
              height: 1.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        },
        itemBuilder: (context, index) {
          return CertificationItem(
            certification: certifications[index],
            user: user,
          );
        },
      ),
    );
  }
}
