import 'package:aprovacao/core/widgets/explanation/explanation_entity.dart';

class ExplanationModel extends ExplanationEntity {
  ExplanationModel({
    required String? text,
    required bool? isTitle,
    required bool? hasPadding,
  }) : super(
    text: text ?? '',
    isTitle: isTitle ?? false,
    hasPadding: hasPadding ?? false,
  );

  factory ExplanationModel.fromJson({
    required Map<String, dynamic> explanation,
  }) {
    return ExplanationModel(
      text: explanation['text'],
      isTitle: explanation['isTitle'],
      hasPadding: explanation['hasPadding'],
    );
  }

  static List<ExplanationEntity> fromList({
    required jsonList,
  }) {
    final explanationText = <ExplanationEntity>[];

    (jsonList as List).forEach((element) { 
      explanationText.add(ExplanationModel.fromJson(
        explanation: element,
      ));
    });

    return explanationText;
  }
}
