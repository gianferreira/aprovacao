import 'package:aprovacao/core/validators/password_validators.dart';
import 'package:aprovacao/core/widgets/text_field/aprovacao_password_field.dart';
import 'package:flutter/material.dart';

class UserSIgnupPassowrdCreation extends StatelessWidget with PasswordFormValidations {
  const UserSIgnupPassowrdCreation({
    super.key,
    required this.passwordTextController,
  });

  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return AprovacaoPasswordField(
      label: 'Senha',
      hintText: 'Informe a sua senha',
      textFieldController: passwordTextController,
      confirmation: true,
      validator: (value) => combine([
        () => isNotEmpty(value),
        () => hasMinimumCharacters(value),
        () => hasUppercaseAndLowercase(value),
        () => hasNumericCharacter(value),
        () => hasSpecialCharacter(value),
      ]),
    );
  }
}
