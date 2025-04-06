import 'package:aprovacao/core/widgets/explanation/explanation_entity.dart';

class ModuleEntity {
  final String id;
  final String userModuleId;
  final String title;
  final String certificationId;
  final List<ExplanationEntity> explanation;
  final bool availablePresentation; 
  final bool availableRevision;
  final String userId; 

  const ModuleEntity({
    required this.id,
    required this.userModuleId,
    required this.title,
    required this.certificationId,
    required this.explanation,
    required this.availablePresentation,
    required this.availableRevision,
    required this.userId,
  });
}

typedef ModulesSnapshots =  ({
  List<Map<String, dynamic>> userModules, 
  List<Map<String, dynamic>> modules,
}); 

extension ModulesExtension on List<ModuleEntity> {
  ModuleEntity get currentModule => firstWhere(
    (element) => element.availablePresentation,
    orElse: () => finishedModules ? last : first,
  );

  bool get finishedModules => every(
    (element) => element.availableRevision,
  );
}

extension ModuleExtension on ModuleEntity {
  int get sequenceId => int.parse(id);
}
