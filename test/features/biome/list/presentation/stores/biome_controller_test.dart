import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:professional_development/core/arch/failures/failures.dart';
import 'package:professional_development/core/arch/use_case/use_case.dart';
import 'package:professional_development/features/biome/list/domain/entities/biome_entity.dart';
import 'package:professional_development/features/biome/list/domain/usecases/load_biomes_use_case.dart';
import 'package:professional_development/features/biome/list/presentation/stores/biome_controller.dart';
import 'package:professional_development/features/biome/list/presentation/stores/biome_state.dart';

@GenerateNiceMocks([MockSpec<LoadBiomesUsecase>()])
import 'biome_controller_test.mocks.dart';

void main() {
  late BiomeController biomeController;
  late LoadBiomesUsecase loadBiomesUsecase;

  setUp(() {
    loadBiomesUsecase = MockLoadBiomesUsecase();

    biomeController = BiomeController(
      usecase: loadBiomesUsecase,
    );
  });

  test(
    'should init with the correct initial state',
    () {
      expect(
        biomeController.value,
        isA<BiomeEmpty>(),
      );
    },
  );

  test(
    'should notify BiomeError state when loadBiomesUsecase returns error',
    () async {
      when(
        loadBiomesUsecase.call(
          NoParams(),
        ),
      ).thenAnswer(
        (_) async => Left(
          ServerFailureWithMessage(
            500,
            'Error message',
          ),
        ),
      );

      biomeController.loadBiomes();

      expectLater(biomeController.value, isA<BiomeError>());
    },
  );

  test(
    'should notify BiomeSuccess state when loadBiomesUsecase returns success',
    () async {
      when(
        loadBiomesUsecase.call(
          NoParams(),
        ),
      ).thenAnswer(
        (_) async => Right(
          <BiomeEntity>[],
        ),
      );

      biomeController.loadBiomes();

      expectLater(biomeController.value, isA<BiomeSuccess>());
    },
  );
}
