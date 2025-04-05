import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_error.dart';
import 'package:aprovacao/core/widgets/structure/aprovacao_loading_view.dart';
import 'package:aprovacao/features/certifications/list/presentation/pages/certifications_list_view.dart';
import 'package:aprovacao/features/certifications/list/presentation/stores/certifications_controller.dart';
import 'package:aprovacao/features/certifications/list/presentation/stores/certifications_state.dart';
import 'package:aprovacao/features/user/signin/presentation/pages/user_signin_page.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/certifications/list/certifications_injection_container.dart' as certifications_dependencies;

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
    certificationsController.loadCertifications(
      userId: widget.user.id,
    );

    super.initState();
  }

  @override
  void dispose() {
    certificationsController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CertificationsState>(
      valueListenable: certificationsController, 
      builder: (context, state, child) {
        if(state is CertificationsSuccess) {
          return CertificationsListView(
            certifications: state.certifications,
            user: widget.user,
          );
        } else if(state is CertificationsLoading) {
          return AprovacaoLoadingView();
        } else {
          AprovacaoSnackBarError.show(
            context: context,
            title: 'Ocorreu um erro, ao tentar carregar as suas certificações.',
            message: 'Por favor, tente prosseguir em alguns instantes.',
          );

          return AprovacaoNavigatorBuilder.pushReplacement(
            context: context, 
            route: UserSignInPage(),
            routeName: Routes.signIn,
          );
        }
      },
    );
  }
}
