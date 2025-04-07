class ResetModuleEntity {
  final bool availablePresentation; 
  final bool availableRevision;

  const ResetModuleEntity({
    this.availablePresentation = true,
    this.availableRevision = false,
  });
}

typedef ResetModuleSnapshot = Map<String, dynamic>;
