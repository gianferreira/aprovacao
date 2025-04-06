import 'package:aprovacao/features/questions/feedback/domain/usecases/questions_feedback_difficulty_enum.dart';
import 'package:aprovacao/features/questions/feedback/presentation/widgets/questions_feedback_indicator.dart';
import 'package:flutter/material.dart';

class QuestionsFeedbackDifficulty extends StatelessWidget {
  const QuestionsFeedbackDifficulty({
    Key? key,
    required this.difficulty,
    required this.difficultyController,
  }) : super(key: key);

  final QuestionsFeedbackEnum difficulty;
  final ValueNotifier<int> difficultyController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: ValueListenableBuilder<int>(
        valueListenable: difficultyController,
        builder: (context, selectedLevel, child) {
          return InkWell(
            onTap: () {
              difficultyController.value == difficulty.level
                ? difficultyController.value = 0
                : difficultyController.value = difficulty.level;
            },
            splashColor: Color(0xFF02CEFD).withOpacity(0.05),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0, color: selectedLevel == difficulty.level
                    ? Color(0xFF02CEFD)
                    : Color(0xFFF0F0F0),
                ),
                borderRadius: BorderRadius.circular(8.0),
                color: selectedLevel == difficulty.level
                  ? Color(0xFF02CEFD).withOpacity(0.05)
                  : Color(0xFFF0F0F0),
              ),
              padding: const EdgeInsets.all(
                15.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16.0,
                    ),
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF5F5F5F),
                      ),
                      child: Text(
                        difficulty.level.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'MyriadProRegular',
                          height: 1.2,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF0F0F0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              difficulty.title,
                              style: TextStyle(
                                fontFamily: 'MyriadProRegular',
                                height: 1.2,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF5F5F5F),
                              ),
                            ),
                            QuestionsFeedbackIndicator(
                              profileColor: difficulty.color,
                              profileLevel: difficulty.level,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Text(
                            difficulty.description,
                            style: TextStyle(
                              fontFamily: 'MyriadProRegular',
                              height: 1.2,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8F8F8F),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
