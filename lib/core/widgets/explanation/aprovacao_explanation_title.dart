import 'package:aprovacao/core/widgets/explanation/explanation_entity.dart';
import 'package:flutter/material.dart';

class AprovacaoExplanationTitle extends StatelessWidget {
  const AprovacaoExplanationTitle({
    super.key,
    required this.explanation,
    required this.titleColor,
  });

  final ExplanationEntity explanation; 
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32.0,
        bottom: 8.0,
      ),
      child: Text(
        explanation.text,
        style: TextStyle(
          fontFamily: 'MyriadProRegular',
          height: 1.2,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: titleColor,
        ),
      ),
    );
  }
}
