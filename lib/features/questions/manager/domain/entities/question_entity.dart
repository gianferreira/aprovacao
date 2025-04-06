class QuestionEntity {
  final String id;
  final String groupId;
  final String correctAnswer;
  final String description;
  final String firstOption;
  final String secondOption; 
  final String thirdOption;
  final String fourthOption;
  final String explanation;

  const QuestionEntity({
    required this.id,
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
}
