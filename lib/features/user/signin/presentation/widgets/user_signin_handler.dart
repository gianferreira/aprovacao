import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_sign_button.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_error.dart';
import 'package:aprovacao/features/certifications/list/presentation/pages/certifications_list_page.dart';
import 'package:aprovacao/features/user/signin/presentation/stores/signin_controller.dart';
import 'package:aprovacao/features/user/signin/presentation/stores/signin_state.dart';
import 'package:flutter/material.dart';

class UserSignInHandler extends StatelessWidget {
  const UserSignInHandler({
    super.key,
    required this.signInController,
    required this.userTextController,
    required this.passwordTextController,
    required this.formKey,
  });

  final SignInController signInController;
  final TextEditingController userTextController;
  final TextEditingController passwordTextController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SignInState>(
      valueListenable: signInController,
      builder: (context, state, child) {
        if(state is SignInSuccess) {
          AprovacaoNavigatorBuilder.pushReplacement(
            context: context, 
            route: CertificationsListPage(user: state.loggedUser),
            routeName: Routes.certificationsList,
          );
        } else if(state is SignInError) {
          AprovacaoSnackBarError.show(
            context: context,
            title: state.errorMessage,
            message: 'Por favor, tente prosseguir em alguns instantes',
          );
        }
  
        return AprovacaoSignButton(
          text: 'Acessar sua conta',
          isLoading: state is SignInLoading,
          padding: EdgeInsets.only(
            bottom: 16.0,
          ),
          onPressed: () {
            if(formKey.currentState?.validate() ?? false) {
              signInController.signIn(
                email: userTextController.text, 
                password: passwordTextController.text,
              );
            }
          },
        );
      }
    );
  }
}
