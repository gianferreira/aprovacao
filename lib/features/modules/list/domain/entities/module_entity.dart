class ModuleEntity {
  final String id;
  final String title;
  final String certificationId;
  final String icon;
  final String presentation;
  final bool availablePresentation; 
  final bool availableRevision;
  final String userId;  

  const ModuleEntity({
    required this.id,
    required this.title,
    required this.certificationId,
    required this.icon,
    required this.presentation,
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
    (element) => element.availableRevision,
    orElse: () => finishedModules ? last : first,
  );

  bool get finishedModules => every(
    (element) => element.availableRevision,
  );
}

extension ModuleExtension on ModuleEntity {
  int get sequenceId => int.parse(id);
}
