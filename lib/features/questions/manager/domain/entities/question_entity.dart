import 'package:aprovacao/core/widgets/explanation/explanation_entity.dart';

class QuestionEntity {
  final String id;
  final String questionIndicator;
  final String groupId;
  final String correctAnswer;
  final String description;
  final String firstOption;
  final String secondOption; 
  final String thirdOption;
  final String fourthOption;
  final List<ExplanationEntity> explanation;

  const QuestionEntity({
    required this.id,
    required this.questionIndicator,
    required this.groupId,
    required this.correctAnswer,
    required this.description,
    required this.firstOption,
    required this.secondOption,
    required this.thirdOption,
    required this.fourthOption,
    required this.explanation,
  });
}

extension QuestionExtension on QuestionEntity {
  int get sequenceId => int.parse(id);

  List<String> get options => [
    firstOption,
    secondOption,
    thirdOption,
    fourthOption,
  ];

  String get questionLabel => 'Questão $questionIndicator';

  String get explanationLabel => 'Correção da Questão $questionIndicator';
}
