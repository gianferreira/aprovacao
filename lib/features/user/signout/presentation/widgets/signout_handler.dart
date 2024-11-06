import 'package:professional_development/core/navigation/arguments/args.dart';
import 'package:professional_development/core/navigation/navigators/navigator_builder.dart';
import 'package:professional_development/core/navigation/routes/routes.dart';
import 'package:professional_development/core/widgets/snacknar/biome_snackbar_error.dart';
import 'package:professional_development/features/user/signout/presentation/stores/signout_controller.dart';
import 'package:professional_development/features/user/signout/presentation/stores/signout_state.dart';
import 'package:flutter/material.dart';

import 'package:professional_development/features/user/signout/signout_injection_container.dart' as sign_out_dependencies;

class SignoutHandler extends StatefulWidget {
  const SignoutHandler({super.key});

  @override
  State<SignoutHandler> createState() => _SignoutHandlerState();
}

class _SignoutHandlerState extends State<SignoutHandler> {
  late SignoutController signoutController;

  @override
  void initState() {
    signoutController = sign_out_dependencies.sl<SignoutController>();

    super.initState();
  }

  @override
  void dispose() {
    signoutController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SignoutState>(
      valueListenable: signoutController,
      builder: (context, state, child) {
        if(state is SignoutSuccess) {
          DevProNavigatorBuilder.pushReplacement(
            context: context, 
            routeName: Routes.signIn,
            args: NoArgs(),
          );
        } else if(state is SignoutError) {
          DevProSnackBarError.show(
            context: context,
            title: state.errorMessage,
            message: 'Por favor, tente prosseguir em alguns instantes',
          );
        }

        return GestureDetector(
          onTap: () {
            signoutController.logout();
          },
          child: Icon(
            Icons.logout_sharp,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        );
      }
    );
  }
}
