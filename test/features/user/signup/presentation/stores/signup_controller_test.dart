import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';
import 'package:professional_development/features/user/signup/domain/usecases/sign_use_case.dart';
import 'package:professional_development/features/user/signup/presentation/stores/signup_controller.dart';
import 'package:professional_development/features/user/signup/presentation/stores/signup_state.dart';

@GenerateNiceMocks([MockSpec<SignUsecase>()])
import 'signup_controller_test.mocks.dart';

void main() {
  late SignUpController signUpController;
  late SignUsecase signUsecase; 
  late String mockName;
  late String mockEmail;
  late String mockPassword;

  setUp(() {
    signUsecase = MockSignUsecase();

    signUpController = SignUpController(
      usecase: signUsecase,
    );

    mockName = 'Gian';
    mockEmail =  'gian@gmail.com';
    mockPassword = '123456';
  });

  test(
    'should init with the correct initial state',
    () {
      expect(
        signUpController.value,
        isA<SignUpEmpty>(),
      );
    },
  );

  test(
    'should notify SignUpError state when signUsecase returns error',
    () async {
      when(
        signUsecase.call(
          SignParams(
            name: mockName,
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

      signUpController.signUp(
        name: mockName,
        email: mockEmail, 
        password: mockPassword,
      );

      expectLater(signUpController.value, isA<SignUpError>());
    },
  );

  test(
    'should notify SignUpSuccess state when signUsecase returns success',
    () async {
      when(
        signUsecase.call(
          SignParams(
            name: mockName,
            email: mockEmail,
            password: mockPassword,
          ),
        ),
      ).thenAnswer(
        (_) async => Right(
          UserEntity(
            id: '1',
            name: mockName,
            email: mockEmail,
          ),
        ),
      );

      signUpController.signUp(
        name: mockName,
        email: mockEmail, 
        password: mockPassword,
      );

      expectLater(signUpController.value, isA<SignUpSuccess>());
    },
  );
}
