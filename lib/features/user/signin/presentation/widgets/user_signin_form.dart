import 'package:aprovacao/core/validators/field_validators.dart';
import 'package:aprovacao/core/widgets/text_field/aprovacao_password_field.dart';
import 'package:aprovacao/core/widgets/text_field/aprovacao_text_field.dart';
import 'package:flutter/material.dart';

class UserSignInForm extends StatelessWidget with AprovacaoFormValidations {
  const UserSignInForm({
    super.key,
    required this.formKey,
    required this.userTextController,
    required this.passwordTextController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userTextController;
  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          AprovacaoTextFormField(
            label: 'E-mail',
            hintText: 'Insira o seu e-mail',
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
            textFieldController: userTextController,
            textInputAction: TextInputAction.next,
            validator: (value) => combine([
              () => isNotEmpty(value),
              () => isEmailValid(value),
            ]),
          ),
          AprovacaoPasswordField(
            label: 'Senha',
            hintText: 'Insira a sua senha',
            textFieldController: passwordTextController,
            confirmation: true,
            validator: (value) => combine([
              () => isNotEmpty(value),
            ]),
          ),
        ],
      ),
    );
  }
}
