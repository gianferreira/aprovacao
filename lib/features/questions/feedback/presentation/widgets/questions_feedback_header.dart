import 'package:aprovacao/features/questions/manager/domain/entities/manager_entity.dart';
import 'package:flutter/material.dart';

class QuestionsFeedbackHeader extends StatelessWidget {
  const QuestionsFeedbackHeader({
    Key? key,
    required this.manager,
  }) : super(key: key);

  final QuestionsManagerEntity manager;

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
            'Voce acertou ${manager.percentageRating}% das questões',
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
            '''Abaixo você pode classificar o nível de dificuldade.''',
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF5F5F5F),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 12.0,
          ),
          child: Text(
            '''O seu índice de acertos, junto a classificação de dificuldade influenciam '''
            '''em quanto tempo essas questões serão revisadas.''',
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF5F5F5F),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
          ),
          child: Text(
            'Classifique a dificuldade das questões anteriores:',
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF101010),
            ),
          ),
        ),
      ],
    );
  }
}
