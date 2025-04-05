import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_error.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_loading_view.dart';
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
    modulesController.loadModules(
      userId: widget.user.id,
      certificationId: widget.certification.id,
    );

    super.initState();
  }

  @override
  void dispose() {
    modulesController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
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
          return AprovacaoLoadingView();
        } else {
          AprovacaoSnackBarError.show(
            context: context,
            title: 'Ocorreu um erro, ao tentar carregar os módulos da certificação.',
            message: 'Por favor, tente prosseguir em alguns instantes.',
          );
          
          return AprovacaoNavigatorBuilder.pop(context: context);
        }
      },
    );
  }
}
