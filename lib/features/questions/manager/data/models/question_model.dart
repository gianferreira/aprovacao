import 'package:aprovacao/core/widgets/explanation/explanation_entity.dart';
import 'package:aprovacao/core/widgets/explanation/explanation_model.dart';
import 'package:aprovacao/features/questions/manager/domain/entities/question_entity.dart';

class QuestionModel extends QuestionEntity {
  QuestionModel({
    required String? id,
    required String? questionIndicator,
    required String? groupId,
    required String? correctAnswer,
    required String? description,
    required String? firstOption,
    required String? secondOption,
    required String? thirdOption,
    required String? fourthOption,
    required List<ExplanationEntity>? explanation,
  }) : super(
    id: id ?? '',
    questionIndicator: questionIndicator ?? '',
    groupId: groupId ?? '',
    correctAnswer: correctAnswer ?? '',
    description: description ?? '',
    firstOption: firstOption ?? '',
    secondOption: secondOption ?? '',
    thirdOption: thirdOption ?? '',
    fourthOption: fourthOption ?? '',
    explanation: explanation ?? [],
  );

  factory QuestionModel.fromJson({
    required Map<String, dynamic> question,
  }) {
    return QuestionModel(
      id: question['id'],
      questionIndicator: question['questionIndicator'],
      groupId: question['group_id'],
      correctAnswer: question['correctAnswer'],
      description: question['description'],
      firstOption: question['firstOption'],
      secondOption: question['secondOption'],
      thirdOption: question['thirdOption'],
      fourthOption: question['fourthOption'],
      explanation: ExplanationModel.fromList(
        jsonList: question['explanation'],
      ),
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
