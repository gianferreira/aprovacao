import 'package:aprovacao/features/user/signup/domain/usecases/sign_use_case.dart';
import 'package:aprovacao/features/user/signup/presentation/stores/signup_state.dart';
import 'package:flutter/material.dart';

class SignUpController extends ValueNotifier<SignUpState> {
  SignUpController({
    required this.usecase,
  }) : super(SignUpEmpty());

  final SignUsecase usecase;

  void signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    value = SignUpLoading();

    final signUpResult = await usecase(
      SignParams(
        email: email, 
        password: password,
        name: name,
      ),
    );

    signUpResult.fold(
      (failure) {
        value = SignUpError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = SignUpSuccess(
          loggedUser: success,
        );
      },
    );
  }
}
