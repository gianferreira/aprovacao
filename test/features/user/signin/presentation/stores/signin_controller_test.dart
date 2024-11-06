import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/features/user/signin/domain/usecases/signin_use_case.dart';
import 'package:professional_development/features/user/signin/presentation/stores/signin_controller.dart';
import 'package:professional_development/features/user/signin/presentation/stores/signin_state.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';

@GenerateNiceMocks([MockSpec<SignInUsecase>()])
import 'signin_controller_test.mocks.dart';

void main() {
  late SignInController signInController;
  late SignInUsecase signInUsecase; 
  late String mockEmail;
  late String mockPassword;

  setUp(() {
    signInUsecase = MockSignInUsecase();

    signInController = SignInController(
      usecase: signInUsecase,
    );

    mockEmail =  'gian@gmail.com';
    mockPassword = '123456';
  });

  test(
    'should init with the correct initial state',
    () {
      expect(
        signInController.value,
        isA<SignInEmpty>(),
      );
    },
  );

  test(
    'should notify SignInError state when signInUsecase returns error',
    () async {
      when(
        signInUsecase.call(
          SignInParams(
            email: mockEmail,
            password: mockPassword,
          ),
        ),
      ).thenAnswer(
        (_) async => Left(
          ServerFailureWithMessage(
            500,
            'Error message',
          ),
        ),
      );

      signInController.signIn(
        email: mockEmail, 
        password: mockPassword,
      );

      expectLater(signInController.value, isA<SignInError>());
    },
  );

  test(
    'should notify SignInSuccess state when signInUsecase returns success',
    () async {
      when(
        signInUsecase.call(
          SignInParams(
            email: mockEmail,
            password: mockPassword,
          ),
        ),
      ).thenAnswer(
        (_) async => Right(
          UserEntity(
            id: '1',
            name: 'Gian',
            email: mockEmail,
          ),
        ),
      );

      signInController.signIn(
        email: mockEmail, 
        password: mockPassword,
      );

      expectLater(signInController.value, isA<SignInSuccess>());
    },
  );
}
