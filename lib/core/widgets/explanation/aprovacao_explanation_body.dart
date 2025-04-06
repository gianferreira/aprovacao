import 'package:aprovacao/core/widgets/explanation/explanation_entity.dart';
import 'package:flutter/material.dart';

class AprovacaoExplanationBody extends StatelessWidget {
  const AprovacaoExplanationBody({
    super.key,
    required this.explanation,
  });

  final ExplanationEntity explanation; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: explanation.hasPadding ? 32.0 : 0.0,
        bottom: explanation.hasPadding ? 8.0 : 0.0,
      ),
      child: Text(
        explanation.text,
        style: TextStyle(
          fontFamily: 'MyriadProRegular',
          height: 1.2,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Color(0xFF5F5F5F),
        ),
      ),
    );
  }
}
