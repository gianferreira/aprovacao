import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/core/arch/use_case/use_case.dart';
import 'package:professional_development/features/user/signout/domain/usecases/signout_use_case.dart';
import 'package:professional_development/features/user/signout/presentation/stores/signout_controller.dart';
import 'package:professional_development/features/user/signout/presentation/stores/signout_state.dart';

@GenerateNiceMocks([MockSpec<SignoutUsecase>()])
import 'signout_controller_test.mocks.dart';

void main() {
  late SignoutController signoutController;
  late SignoutUsecase signoutUsecase; 

  setUp(() {
    signoutUsecase = MockSignoutUsecase();

    signoutController = SignoutController(
      usecase: signoutUsecase,
    );
  });

  test(
    'should init with the correct initial state',
    () {
      expect(
        signoutController.value,
        isA<SignoutEmpty>(),
      );
    },
  );

  test(
    'should notify SignoutError state when signoutUsecase returns error',
    () async {
      when(
        signoutUsecase.call(NoParams()),
      ).thenAnswer(
        (_) async => Left(
          ServerFailureWithMessage(
            500,
            'Error message',
          ),
        ),
      );

      signoutController.logout();

      expectLater(signoutController.value, isA<SignoutError>());
    },
  );

  test(
    'should notify SignoutSuccess state when signoutUsecase returns success',
    () async {
      when(
        signoutUsecase.call(NoParams()),
      ).thenAnswer(
        (_) async => Right(null),
      );

      signoutController.logout();

      expectLater(signoutController.value, isA<SignoutSuccess>());
    },
  );
}
