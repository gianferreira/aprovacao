import 'package:aprovacao/core/validators/field_validators.dart';
import 'package:aprovacao/core/widgets/text_field/aprovacao_text_field.dart';
import 'package:aprovacao/features/user/signup/presentation/widgets/user_signup_password.dart';
import 'package:flutter/material.dart';

class UserSignUpForm extends StatelessWidget with AprovacaoFormValidations {
  const UserSignUpForm({
    super.key,
    required this.formKey,
    required this.nameTextController,
    required this.userTextController,
    required this.passwordTextController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameTextController;
  final TextEditingController userTextController;
  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          AprovacaoTextFormField(
            label: 'Nome',
            hintText: 'Insira o seu nome e sobrenome',
            keyboardType: TextInputType.text,
            textFieldController: nameTextController,
            textInputAction: TextInputAction.next,
            validator: (value) => combine([
              () => isNotEmpty(value),
              () => hasMultipleWords(value),
            ]),
          ),
          AprovacaoTextFormField(
            label: 'E-mail',
            hintText: 'Informe o seu e-mail',
            keyboardType: TextInputType.emailAddress,
            textFieldController: userTextController,
            textCapitalization: TextCapitalization.none,
            textInputAction: TextInputAction.next,
            validator: (value) => combine([
              () => isNotEmpty(value),
              () => isEmailValid(value),
            ]),
          ),
          UserSIgnupPassowrdCreation(
            passwordTextController: passwordTextController,
          ),
        ],
      ),
    );
  }
}
