import 'package:aprovacao/core/widgets/explanation/explanation_entity.dart';
import 'package:flutter/material.dart';

class AprovacaoExplanationTitle extends StatelessWidget {
  const AprovacaoExplanationTitle({
    super.key,
    required this.explanation,
  });

  final ExplanationEntity explanation; 

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
          color: Color(0xFF0075FF),
        ),
      ),
    );
  }
}
