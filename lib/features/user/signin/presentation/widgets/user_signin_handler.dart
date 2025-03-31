import 'package:aprovacao/core/navigation/arguments/user_args.dart';
import 'package:aprovacao/core/navigation/navigators/navigator_builder.dart';
import 'package:aprovacao/core/navigation/routes/routes.dart';
import 'package:aprovacao/core/widgets/snacknar/biome_snackbar_error.dart';
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
          DevProNavigatorBuilder.pushReplacement(
            context: context, 
            routeName: Routes.biomesList, 
            args: UserArgs(user: state.loggedUser),
          );
        } else if(state is SignInError) {
          DevProSnackBarError.show(
            context: context,
            title: state.errorMessage,
            message: 'Por favor, tente prosseguir em alguns instantes',
          );
        }
  
        return FilledButton(
          onPressed: () {
            if(formKey.currentState?.validate() ?? false) {
              signInController.signIn(
                email: userTextController.text, 
                password: passwordTextController.text,
              );
            }
          }, 
          child: state is SignInLoading
            ? SizedBox(
                height: 14.0,
                width: 14.0,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.background,
                ),
              )
            : const Text('Acessar sua conta'),
        );
      }
    );
  }
}
