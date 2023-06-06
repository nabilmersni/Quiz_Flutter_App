class QuizQuestion {
  QuizQuestion(this.text, this.answers, this.isSelected);

  final String text;
  final List<String> answers;
  bool isSelected;

  List<String> getShuffledAnswer() {
    List<String> shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
