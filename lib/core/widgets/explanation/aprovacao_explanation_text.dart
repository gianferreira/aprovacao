import 'package:aprovacao/core/widgets/explanation/aprovacao_explanation_body.dart';
import 'package:aprovacao/core/widgets/explanation/aprovacao_explanation_title.dart';
import 'package:aprovacao/core/widgets/explanation/explanation_entity.dart';
import 'package:flutter/material.dart';

class AprovacaoExplanationText extends StatelessWidget {
  const AprovacaoExplanationText({
    super.key,
    required this.explanationText,
    required this.titleColor,
  });

  final List<ExplanationEntity> explanationText;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        explanationText.length, 
        (index) {
          if(explanationText[index].isTitle) {
            return AprovacaoExplanationTitle(
              explanation: explanationText[index],
              titleColor: titleColor,
            );
          } else {
            return AprovacaoExplanationBody(
              explanation: explanationText[index],
            );
          }
        }
      ),
    );
  }
}
