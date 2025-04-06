import 'package:flutter/material.dart';

enum QuestionsFeedbackEnum {
  Easy(
    level: 1,
    title: 'Fácil',
    color: Color(0xFF66BDEE),
    description: '''Questões de extrema facilidade, em nenhum momento '''
    '''ficou alguma dúvida.''',
  ),
  Moderate(
    level: 2,
    title: 'Razoável',
    color: Color(0xFFECC359),
    description: '''Questões de dificuldade baixa, mas que foi necessário'''
    ''' analisar com calma.''',
  ),
  Complex(
    level: 3,
    title: 'Desafiador',
    color: Color(0xFFEC9759),
    description: '''A questões foram relativamente complicadas, faltou'''
    ''' familiriade com os conteúdos.''',
  ),
  Hard(
    level: 4,
    title: 'Difícil',
    color: Color(0xFFEC5959),
    description: '''Questões muito difíceis, será necessário mais estudo '''
    '''para respondê-las.''',
  );

  const QuestionsFeedbackEnum({
    required this.level,
    required this.title,
    required this.color,
    required this.description,
  });

  final int level;
  final String title;
  final Color color;
  final String description;
}
