import 'package:aprovacao/features/reset/domain/entities/reset_module_entity.dart';

class ResetModuleModel extends ResetModuleEntity {
  ResetModuleSnapshot toJson({
    required Map<String, dynamic> module,
  }) {
    return {
      'id': module['id'],
      'module_id': module['module_id'],
      'user_id': module['user_id'],
      'availableRevision': availableRevision,
      'availablePresentation': availablePresentation,
    };
  }
}
