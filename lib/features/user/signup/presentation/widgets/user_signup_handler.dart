import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/button/aprovacao_sign_button.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_error.dart';
import 'package:aprovacao/core/widgets/snackbar/aprovacao_snackbar_success.dart';
import 'package:aprovacao/features/certifications/list/presentation/pages/certifications_list_page.dart';
import 'package:aprovacao/features/user/signup/presentation/stores/signup_controller.dart';
import 'package:aprovacao/features/user/signup/presentation/stores/signup_state.dart';
import 'package:flutter/material.dart';

class UserSignUpHandler extends StatelessWidget {
  const UserSignUpHandler({
    super.key,
    required this.signUpController,
    required this.userTextController,
    required this.passwordTextController,
    required this.nameTextController,
    required this.formKey,
  });

  final SignUpController signUpController;
  final TextEditingController nameTextController;
  final TextEditingController userTextController;
  final TextEditingController passwordTextController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SignUpState>(
      valueListenable: signUpController,
      builder: (context, state, child) {
        if(state is SignUpSuccess) {
          AprovacaoSnackBarSuccess.show(
            context: context,
            title: 'Usuário criado com sucesso!',
          );

          AprovacaoNavigatorBuilder.pop(context: context);
          AprovacaoNavigatorBuilder.pushReplacement(
            context: context,
            route: CertificationsListPage(user: state.loggedUser),
            routeName: Routes.certificationsList, 
          );
        } else if(state is SignUpError) {
          AprovacaoSnackBarError.show(
            context: context,
            title: state.errorMessage,
            message: 'Por favor, tente prosseguir em alguns instantes',
          );
        }
  
        return AprovacaoSignButton(
          text: 'Crie uma conta',
          isLoading: state is SignUpLoading,
          padding: EdgeInsets.only(
            bottom: 16.0,
          ),
          onPressed: () {
            if(formKey.currentState?.validate() ?? false) {
              signUpController.signUp(
                name: nameTextController.text,
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
