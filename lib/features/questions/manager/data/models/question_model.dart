import 'package:aprovacao/features/questions/manager/domain/entities/question_entity.dart';

class QuestionModel extends QuestionEntity {
  QuestionModel({
    required String? id,
    required String? groupId,
    required String? correctAnswer,
    required String? description,
    required String? firstOption,
    required String? secondOption,
    required String? thirdOption,
    required String? fourthOption,
    required String? explanation,
  }) : super(
    id: id ?? '',
    groupId: groupId ?? '',
    correctAnswer: correctAnswer ?? '',
    description: description ?? '',
    firstOption: firstOption ?? '',
    secondOption: secondOption ?? '',
    thirdOption: thirdOption ?? '',
    fourthOption: fourthOption ?? '',
    explanation: explanation ?? ''
  );

  factory QuestionModel.fromJson({
    required Map<String, dynamic> question,
  }) {
    return QuestionModel(
      id: question['id'],
      groupId: question['group_id'],
      correctAnswer: question['correctAnswer'],
      description: question['description'],
      firstOption: question['firstOption'],
      secondOption: question['secondOption'],
      thirdOption: question['thirdOption'],
      fourthOption: question['fourthOption'],
      explanation: question['explanation'],
    );
  }

  static List<QuestionEntity> fromList({
    required List<Map<String, dynamic>> jsonList,
  }) {
    final questions = <QuestionEntity>[];

    jsonList.forEach((element) { 
      questions.add(QuestionModel.fromJson(
        question: element,
      ));
    });

    return questions;
  }
}
