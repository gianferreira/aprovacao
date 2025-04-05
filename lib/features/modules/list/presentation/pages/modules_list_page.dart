import 'package:aprovacao/features/modules/list/presentation/stores/modules_state.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/presentation/pages/modules_list_view.dart';
import 'package:aprovacao/features/modules/list/presentation/stores/modules_controller.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/modules/list/modules_injection_container.dart' as modules_dependencies;

class ModulesListPage extends StatefulWidget {
  const ModulesListPage({
    super.key,
    required this.user,
    required this.certification,
  });

  final UserEntity user;
  final CertificationEntity certification;

  @override
  State<ModulesListPage> createState() => _ModulesListPageState();
}

class _ModulesListPageState extends State<ModulesListPage> {
  late ModulesController modulesController;

  @override
  void initState() {
    modulesController = modules_dependencies.sl<ModulesController>();

    super.initState();
  }

  @override
  void dispose() {
    modulesController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    modulesController.loadModules(
      userId: widget.user.id,
      certificationId: widget.certification.id,
    );

    return ValueListenableBuilder<ModulesState>(
      valueListenable: modulesController, 
      builder: (context, state, child) {
        if(state is ModulesSuccess) {
          return ModulesListView(
            modules: state.modules,
            certification: widget.certification,
            user: widget.user,
          );
        } else if(state is ModulesLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Color(0xFF0075FF),
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
