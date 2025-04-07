class ResetGroupEntity {
  final int revisionTime;
  final int timesAnswered;
  final int totalAnswers; 
  final int correctAnswers;
  final int answerRating;

  const ResetGroupEntity({
    this.revisionTime = 3,
    this.timesAnswered = 0,
    this.totalAnswers = 0,
    this.correctAnswers = 0,
    this.answerRating = 0,
  });
}

typedef ResetGroupSnapshot = Map<String, dynamic>;
