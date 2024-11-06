import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/features/biome/list/domain/entities/biome_entity.dart';
import 'package:professional_development/features/contributions/create/domain/usecases/create_contribution_use_case.dart';
import 'package:professional_development/features/contributions/create/presentation/stores/create_contribution_controller.dart';
import 'package:professional_development/features/contributions/create/presentation/stores/create_contribution_state.dart';
import 'package:professional_development/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:professional_development/features/user/signup/domain/entities/user_entity.dart';

@GenerateNiceMocks([MockSpec<CreateContributionUsecase>()])
import 'create_contribution_controller_test.mocks.dart';

void main() {
  late CreateContributionController createContributionController;
  late CreateContributionUsecase createUsecase;
  late ContributionEntity mockContribution;
  late BiomeEntity mockBIome;
  late UserEntity mockUser;

  setUp(() {
    createUsecase = MockCreateContributionUsecase();

    createContributionController = CreateContributionController(
      usecase: createUsecase,
    );

    mockContribution = ContributionEntity(
      id: '1',
      userId: '1',
      biomeId: '1',
      description: 'Description',
      title: 'Title',
      userName: 'Gian',
    );

    mockBIome = BiomeEntity(
      id: '1',
      name: 'Biome',
      currentArea: '',
      urlImage: '',
      shortExplanation: '',
      longExplanation: [],
    );

    mockUser = UserEntity(
      id: '1', 
      name: 'Gian', 
      email: 'gian@email.com',
    );
  });

  test(
    'should init with the correct initial state',
    () {
      expect(
        createContributionController.value,
        isA<CreateContributionEmpty>(),
      );
    },
  );

  test(
    'should notify CreateContributionError state when createUsecase returns error',
    () async {
      when(
        createUsecase.call(
          CreateContributionParams(
            contribution: mockContribution,
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

      createContributionController.createContribution(
        user: mockUser,
        biome: mockBIome,
        description: mockContribution.description,
        title: mockContribution.title,
      );

      expectLater(createContributionController.value, isA<CreateContributionError>());
    },
  );

  test(
    'should notify CreateContributionSuccess state when createUsecase returns success',
    () async {
      when(
        createUsecase.call(
          CreateContributionParams(
            contribution: mockContribution,
          ),
        ),
      ).thenAnswer(
        (_) async => Right(
          mockContribution,
        ),
      );

      createContributionController.createContribution(
        user: mockUser,
        biome: mockBIome,
        description: mockContribution.description,
        title: mockContribution.title,
      );

      expectLater(createContributionController.value, isA<CreateContributionSuccess>());
    },
  );
}
