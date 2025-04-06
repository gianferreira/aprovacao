import 'package:aprovacao/core/widgets/explanation/explanation_entity.dart';
import 'package:aprovacao/core/widgets/explanation/explanation_model.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';

class ModuleModel extends ModuleEntity {
  ModuleModel({
    required String? id,
    required String? title,
    required String? certificationId,
    required List<ExplanationEntity>? explanation,
    required bool? availablePresentation,
    required bool? availableRevision,
    required String? userId,      
  }) : super(
    id: id ?? '',
    title: title ?? '',
    certificationId: certificationId ?? '',
    explanation: explanation ?? [],
    availablePresentation: availablePresentation ?? false,
    availableRevision: availableRevision ?? false,
    userId: userId ?? '',
  );

  factory ModuleModel.fromJson({
    required Map<String, dynamic> userModule,
    required Map<String, dynamic> module,
  }) {
    return ModuleModel(
      id: module['id'],
      title: module['title'],
      certificationId: module['certification_id'],
      availablePresentation: userModule['availablePresentation'],
      availableRevision: userModule['availableRevision'],
      userId: userModule['user_id'],
      explanation: ExplanationModel.fromList(
        jsonList: module['explanation'],
      ),
    );
  }

  static List<ModuleEntity> fromDataBase({
    required ModulesSnapshots snapshots,
  }) {
    final modules = <ModuleEntity>[];

    final userModulesDocs = snapshots.userModules;
    final modulesDocs = snapshots.modules;

    for (int index = 0; index < userModulesDocs.length; index++) {
      modules.add(ModuleModel.fromJson(
        userModule: userModulesDocs[index],
        module: modulesDocs[index],
      ));
    }

    return modules;
  }
}
