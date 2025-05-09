import 'package:aprovacao/core/navigation/navigators/navigator.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_tonal_button.dart';
import 'package:aprovacao/features/user/signup/presentation/stores/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:aprovacao/features/user/signup/presentation/widgets/user_signup_form.dart';
import 'package:aprovacao/features/user/signup/presentation/widgets/user_signup_handler.dart';
import 'package:aprovacao/features/user/signup/presentation/widgets/user_signup_logo.dart';

import 'package:aprovacao/features/user/signup/signup_injection_container.dart' as sign_up_dependencies;

class UserSignUpView extends StatefulWidget {
  const UserSignUpView({
    super.key,
  });

  @override
  State<UserSignUpView> createState() => _UserSignUpViewState();
}

class _UserSignUpViewState extends State<UserSignUpView> {
  late SignUpController signUpController;

  late GlobalKey<FormState> formKey;
  late TextEditingController nameTextController;
  late TextEditingController userTextController;
  late TextEditingController passwordTextController;

  @override
  void initState() {
    signUpController = sign_up_dependencies.sl<SignUpController>();

    formKey = GlobalKey<FormState>();
    nameTextController = TextEditingController();
    userTextController = TextEditingController();
    passwordTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    signUpController.dispose();

    nameTextController.dispose();
    userTextController.dispose();
    passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B1C40),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 36.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const UserSignUpLogo(),
              UserSignUpForm(
                formKey: formKey,
                nameTextController: nameTextController,
                userTextController: userTextController,
                passwordTextController: passwordTextController,
              ),
              const SizedBox(height: 32.0),
              UserSignUpHandler(
                formKey: formKey,
                signUpController: signUpController,              
                nameTextController: nameTextController,
                userTextController: userTextController,
                passwordTextController: passwordTextController,
              ),
              const SizedBox(height: 16.0),
              AprovacaoTonalButton(
                text: 'Cancelar',
                padding: EdgeInsets.only(
                  bottom: 16.0,
                ),
                onPressed: () {
                  AprovacaoNavigator.pop(context: context);
                }, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
