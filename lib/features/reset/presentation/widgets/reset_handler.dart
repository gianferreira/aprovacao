import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_error.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_success.dart';
import 'package:aprovacao/core/widgets/warning/aprovacao_reset_sheet.dart';
import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/reset/presentation/stores/reset_controller.dart';
import 'package:aprovacao/features/reset/presentation/stores/reset_state.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/reset/reset_injection_container.dart' as reset_dependencies;

class ResetHandler extends StatefulWidget {
  const ResetHandler({
    super.key,
    required this.user,
    required this.certification,
  });

  final UserEntity user;
  final CertificationEntity certification;

  @override
  State<ResetHandler> createState() => _ResetHandlerState();
}

class _ResetHandlerState extends State<ResetHandler> {
  late ResetController resetController;

  @override
  void initState() {
    resetController = reset_dependencies.sl<ResetController>();

    super.initState();
  }

  @override
  void dispose() {
    resetController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ResetState>(
      valueListenable: resetController,
      builder: (context, state, child) {
        if(state is ResetSuccess) {
          AprovacaoNavigatorBuilder.pop(context: context);
          AprovacaoNavigatorBuilder.pop(context: context);
          AprovacaoNavigatorBuilder.pop(context: context);

          AprovacaoSnackBarSuccess.show(
            context: context,
            title: 'Seu progresso foi resetado com sucesso!',
          );
        } else if(state is ResetError) {
          AprovacaoNavigatorBuilder.pop(context: context);
          AprovacaoNavigatorBuilder.pop(context: context);
          AprovacaoNavigatorBuilder.pop(context: context);

          AprovacaoSnackBarError.show(
            context: context,
            title: state.errorMessage,
            message: 'Por favor, tente prosseguir em alguns instantes',
          );
        }

        return AprovacaoResetBottomSheet(
          onReset: () {
            resetController.resetProgress(
              user: widget.user,
              certification: widget.certification,
            );
          },
        );
      }
    );
  }
}
