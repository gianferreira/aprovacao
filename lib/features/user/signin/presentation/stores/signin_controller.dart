import 'package:professional_development/features/user/signin/domain/usecases/signin_use_case.dart';
import 'package:professional_development/features/user/signin/presentation/stores/signin_state.dart';
import 'package:flutter/material.dart';

class SignInController extends ValueNotifier<SignInState> {
  SignInController({
    required this.usecase,
  }) : super(SignInEmpty());

  final SignInUsecase usecase;

  void signIn({
    required String email,
    required String password,
  }) async {
    value = SignInLoading();

    final signInResult = await usecase(
      SignInParams(
        email: email, 
        password: password,
      ),
    );

    signInResult.fold(
      (failure) {
        value = SignInError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = SignInSuccess(
          loggedUser: success,
        );
      },
    );
  }
}
