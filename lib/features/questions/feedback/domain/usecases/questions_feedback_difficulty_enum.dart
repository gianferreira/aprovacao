import 'package:flutter/material.dart';

enum QuestionsFeedbackDifficultyEnum {
  Easy,
  Moderate,
  Complex,
  Hard,
}

extension QuestionsFeedbackDifficultyEnumExtension on QuestionsFeedbackDifficultyEnum {
  int get level {
    switch (this) {
      case QuestionsFeedbackDifficultyEnum.Easy:
        return 1;
      case QuestionsFeedbackDifficultyEnum.Moderate:
        return 2;
      case QuestionsFeedbackDifficultyEnum.Complex:
        return 3;
      case QuestionsFeedbackDifficultyEnum.Hard:
        return 4;
      default:
        return 0;
    }
  }

  String get title {
    switch (this) {
      case QuestionsFeedbackDifficultyEnum.Easy:
        return 'Fácil';
      case QuestionsFeedbackDifficultyEnum.Moderate:
        return 'Razoável';
      case QuestionsFeedbackDifficultyEnum.Complex:
        return 'Desafiador';
      case QuestionsFeedbackDifficultyEnum.Hard:
        return 'Difícil';
      default:
        return '';
    }
  }

  String get description {
    switch (this) {
      case QuestionsFeedbackDifficultyEnum.Easy:
        return '''Questões de extrema facilidade, em nenhum momento '''
        '''ficou alguma dúvida.''';
      case QuestionsFeedbackDifficultyEnum.Moderate:
        return '''Questões de dificuldade baixa, mas que foi necessário'''
          ''' analisar com calma.''';
      case QuestionsFeedbackDifficultyEnum.Complex:
        return '''A questões foram relativamente complicadas, faltou'''
          ''' familiriade com os conteúdos.''';
      case QuestionsFeedbackDifficultyEnum.Hard:
        return '''QuestÕes muito difíceis, será necessário mais estudo '''
          '''para responder as mesmas.''';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case QuestionsFeedbackDifficultyEnum.Easy:
        return Color(0xFF66BDEE);
      case QuestionsFeedbackDifficultyEnum.Moderate:
        return Color(0xFFECC359);
      case QuestionsFeedbackDifficultyEnum.Complex:
        return Color(0xFFEC9759);
      case QuestionsFeedbackDifficultyEnum.Hard:
        return Color(0xFFEC5959);
      default:
        return Color(0xFF66BDEE);
    }
  }
}
