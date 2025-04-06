import 'package:aprovacao/features/certifications/list/domain/entities/certification_entity.dart';
import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/group_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/question_entity.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';

class QuestionsManagerEntity {
  final GroupEntity group;
  final ModuleEntity module;
  final CertificationEntity certification;
  final UserEntity user;
  final QuestionEntity currentQUestion;
  final int corrects;
  final int difficulty;

  const QuestionsManagerEntity({
    required this.group,
    required this.module,
    required this.user,
    required this.certification,
    required this.difficulty,
    required this.currentQUestion,
    required this.corrects,
  });

  QuestionsManagerEntity copyWith({
    GroupEntity? group,
    ModuleEntity? module,
    CertificationEntity? certification,
    UserEntity? user,
    QuestionEntity? currentQUestion,
    int? difficulty,
    int? corrects,
  }) {
    return QuestionsManagerEntity(
      group: group ?? this.group,
      module: module ?? this.module,
      certification: certification ?? this.certification,
      user: user ?? this.user,
      currentQUestion: currentQUestion ?? this.currentQUestion,
      difficulty: difficulty ?? this.difficulty,
      corrects: corrects ?? this.corrects,
    );
  }
}

extension QuestionsManagerExtension on QuestionsManagerEntity {
  List<QuestionEntity> get questions => group.questions;

  QuestionEntity get previousQuestion => questions.lastWhere(
    (element) => element.sequenceId < currentQUestion.sequenceId,
    orElse: () => questions.first,
  );

  QuestionEntity get nextQuestion => questions.firstWhere(
    (element) => element.sequenceId > currentQUestion.sequenceId,
    orElse: () => questions.last,
  );

  bool get isFirstQuestion => currentQUestion == questions.first;

  bool get isLastQuestion => currentQUestion == questions.last;

  int get percentageRating => ((corrects / questions.length) * 100).toInt();
}
