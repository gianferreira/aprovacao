import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_tonal_button.dart';
import 'package:aprovacao/features/user/signin/presentation/stores/signin_controller.dart';
import 'package:aprovacao/features/user/signup/presentation/pages/user_signup_page.dart';
import 'package:flutter/material.dart';
import 'package:aprovacao/features/user/signin/presentation/widgets/user_signin_form.dart';
import 'package:aprovacao/features/user/signin/presentation/widgets/user_signin_handler.dart';
import 'package:aprovacao/features/user/signin/presentation/widgets/user_signin_logo.dart';

import 'package:aprovacao/features/user/signin/signin_injection_container.dart' as sign_in_dependencies;

class UserSignInView extends StatefulWidget {
  const UserSignInView({
    super.key,
  });

  @override
  State<UserSignInView> createState() => _UserSignInViewState();
}

class _UserSignInViewState extends State<UserSignInView> {
  late SignInController signInController;

  late GlobalKey<FormState> formKey;
  late TextEditingController userTextController;
  late TextEditingController passwordTextController;

  @override
  void initState() {
    signInController = sign_in_dependencies.sl<SignInController>();

    formKey = GlobalKey<FormState>();
    userTextController = TextEditingController();
    passwordTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    signInController.dispose();

    userTextController.dispose();
    passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B1C40),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 36.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const UserSignInLogo(),
            UserSignInForm(
              formKey: formKey,
              userTextController: userTextController,
              passwordTextController: passwordTextController,
            ),
            const SizedBox(height: 32.0),
            UserSignInHandler(
              signInController: signInController,
              userTextController: userTextController,
              passwordTextController: passwordTextController,
              formKey: formKey,
            ),
            const SizedBox(height: 16.0),
            AprovacaoTonalButton(
              text: 'Cadastrar-se',
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              onPressed: () {
                AprovacaoNavigator.push(
                  context: context, 
                  route: UserSignUpPage(), 
                  routeName: Routes.signUp
                );
              }, 
            ),
          ],
        ),
      ),
    );
  }
}
