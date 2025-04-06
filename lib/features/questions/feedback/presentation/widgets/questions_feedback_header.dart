import 'package:flutter/material.dart';

class QuestionsFeedbackHeader extends StatelessWidget {
  const QuestionsFeedbackHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            bottom: 8.0,
          ),
          child: Text(
            'Chegamos na última etapa',
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0075FF),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 12.0,
          ),
          child: Text(
            '''Você responderá algumas perguntas rápidas para definir seu perfil de investidor.'''
            ''' A partir dele conseguiremos entender melhor seus objetivos e auxiliar seus '''
            '''investimentos da maneira mais personalizada.''',
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF5F5F5F),
            ),
          ),
        ),
      ],
    );
  }
}
