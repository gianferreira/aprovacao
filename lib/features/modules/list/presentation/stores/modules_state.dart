import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';

abstract class ModulesState {}

class ModulesEmpty extends ModulesState {}

class ModulesLoading extends ModulesState {}

class ModulesSuccess extends ModulesState {
  final List<ModuleEntity> modules;

  ModulesSuccess({
    required this.modules,
  });
}

class ModulesError extends ModulesState {
  final String errorMessage;

  ModulesError({
    required this.errorMessage,
  });
}
