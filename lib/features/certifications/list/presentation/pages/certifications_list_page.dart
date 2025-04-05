import 'package:aprovacao/features/certifications/list/presentation/pages/certifications_list_view.dart';
import 'package:aprovacao/features/certifications/list/presentation/stores/certifications_controller.dart';
import 'package:aprovacao/features/certifications/list/presentation/stores/certifications_state.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/certifications/certifications_injection_container.dart' as certifications_dependencies;

class CertificationsListPage extends StatefulWidget {
  const CertificationsListPage({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  State<CertificationsListPage> createState() => _CertificationsListPageState();
}

class _CertificationsListPageState extends State<CertificationsListPage> {
  late CertificationsController certificationsController;

  @override
  void initState() {
    certificationsController = certifications_dependencies.sl<CertificationsController>();

    super.initState();
  }

  @override
  void dispose() {
    certificationsController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    certificationsController.loadCertifications(
      userId: widget.user.id,
    );

    return ValueListenableBuilder<CertificationsState>(
      valueListenable: certificationsController, 
      builder: (context, state, child) {
        if(state is CertificationsSuccess) {
          return CertificationsListView(
            certifications: state.certifications,
            user: widget.user,
          );
        } else if(state is CertificationsLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Deu ruim!'),
            ),
          );
        }
      },
    );
  }
}
