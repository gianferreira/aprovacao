import 'package:aprovacao/features/modules/list/presentation/stores/modules_state.dart';
import 'package:aprovacao/features/modules/list/domain/usecases/load_modules_use_case.dart';
import 'package:flutter/material.dart';

class ModulesController extends ValueNotifier<ModulesState> {
  ModulesController({
    required this.usecase,
  }) : super(ModulesEmpty());

  final LoadModulesUsecase usecase;

  void loadModules({
    required String userId,
    required String certificationId,
  }) async {
    value = ModulesLoading();

    final loadModulesResult = await usecase(LoadModulesParams(
      userId: userId,
      certificationId: certificationId,
    ));

    loadModulesResult.fold(
      (failure) {
        value = ModulesError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = ModulesSuccess(
          modules: success,
        );
      },
    );
  }
}
