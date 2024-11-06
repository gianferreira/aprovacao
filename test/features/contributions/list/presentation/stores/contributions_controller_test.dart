import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:professional_development/features/contributions/list/domain/usecases/load_contributions_use_case.dart';
import 'package:professional_development/features/contributions/list/presentation/stores/contributions_controller.dart';
import 'package:professional_development/features/contributions/list/presentation/stores/contributions_state.dart';

@GenerateNiceMocks([MockSpec<LoadContributionsUsecase>()])
import 'contributions_controller_test.mocks.dart';

void main() {
  late ContributionController contributionController;
  late LoadContributionsUsecase contributionsUsecase;
  late String mockBiomeId;

  setUp(() {
    contributionsUsecase = MockLoadContributionsUsecase();

    contributionController = ContributionController(
      usecase: contributionsUsecase,
    );

    mockBiomeId = '1';
  });

  test(
    'should init with the correct initial state',
    () {
      expect(
        contributionController.value,
        isA<ContributionEmpty>(),
      );
    },
  );

  test(
    'should notify ContributionError state when contributionsUsecase returns error',
    () async {
      when(
        contributionsUsecase.call(
          LoadContributionsParams(biomeId: mockBiomeId),
        ),
      ).thenAnswer(
        (_) async => Left(
          ServerFailureWithMessage(
            500,
            'Error message',
          ),
        ),
      );

      contributionController.loadContributionsFromBiome(
        id: mockBiomeId,
      );

      expectLater(contributionController.value, isA<ContributionError>());
    },
  );

  test(
    'should notify ContributionSuccess state when contributionsUsecase returns success',
    () async {
      when(
        contributionsUsecase.call(
          LoadContributionsParams(biomeId: mockBiomeId),
        ),
      ).thenAnswer(
        (_) async => Right(
          <ContributionEntity>[],
        ),
      );

      contributionController.loadContributionsFromBiome(
        id: mockBiomeId,
      );

      expectLater(contributionController.value, isA<ContributionSuccess>());
    },
  );
}
