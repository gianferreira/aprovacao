import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/snacknar/aprovacao_snackbar_error.dart';
import 'package:aprovacao/features/user/signin/presentation/pages/user_signin_page.dart';
import 'package:aprovacao/features/user/signout/presentation/stores/signout_controller.dart';
import 'package:aprovacao/features/user/signout/presentation/stores/signout_state.dart';
import 'package:flutter/material.dart';

import 'package:aprovacao/features/user/signout/signout_injection_container.dart' as sign_out_dependencies;

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
          AprovacaoNavigatorBuilder.pushReplacement(
            context: context, 
            route: UserSignInPage(),
            routeName: Routes.signIn,
          );
        } else if(state is SignoutError) {
          AprovacaoSnackBarError.show(
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
            color: Colors.white,
            size: 18.0,
          ),
        );
      }
    );
  }
}
