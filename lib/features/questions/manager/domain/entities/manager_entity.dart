import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/group_entity.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/question_entity.dart';
import 'package:aprovacao/features/user/signup/domain/entities/user_entity.dart';

class QuestionsManagerEntity {
  final GroupEntity group;
  final ModuleEntity module;
  final UserEntity user;
  final QuestionEntity currentQUestion;
  final int difficulty;

  const QuestionsManagerEntity({
    required this.group,
    required this.module,
    required this.user,
    required this.difficulty,
    required this.currentQUestion,
  });

  QuestionsManagerEntity copyWith({
    GroupEntity? group,
    ModuleEntity? module,
    UserEntity? user,
    QuestionEntity? currentQUestion,
    int? difficulty,
  }) {
    return QuestionsManagerEntity(
      group: group ?? this.group,
      module: module ?? this.module,
      user: user ?? this.user,
      currentQUestion: currentQUestion ?? this.currentQUestion,
      difficulty: difficulty ?? this.difficulty,
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
}
