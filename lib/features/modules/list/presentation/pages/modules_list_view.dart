import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ModulesListView extends StatelessWidget {
  const ModulesListView({
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          certification.title,
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
        itemCount: modules.length,
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
          return Text(
            modules[index].title,
            style: TextStyle(
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
