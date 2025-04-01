import 'package:aprovacao/core/validators/field_validators.dart';
import 'package:aprovacao/core/widgets/text_fields/text_form_field.dart';
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
          BiomeTextFormField(
            label: 'Nome',
            hintText: 'Insira o seu nome e sobrenome',
            maxLines: 1,
            minLines: 1,
            textFieldController: nameTextController,
            textInputAction: TextInputAction.next,
            validator: (value) => combine([
              () => isNotEmpty(value),
              () => hasMultipleWords(value),
            ]),
          ),
          const SizedBox(height: 16.0),
          BiomeTextFormField(
            label: 'E-mail',
            hintText: 'Informe o seu e-mail para acesso',
            maxLines: 1,
            minLines: 1,
            textFieldController: userTextController,
            textInputAction: TextInputAction.next,
            validator: (value) => combine([
              () => isNotEmpty(value),
              () => isEmailValid(value),
            ]),
          ),
          const SizedBox(height: 16.0),
          UserSIgnupPassowrdCreatopm(
            passwordTextController: passwordTextController,
          ),
        ],
      ),
    );
  }
}
