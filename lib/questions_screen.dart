import 'package:flutter/material.dart';
import 'package:quiz_app/answer_item.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  List<bool> answerSelections = [];
  String currentAnswer = "";
  List<String> shufledList = [];

  @override
  void initState() {
    answerSelections = List<bool>.filled(
        questions[currentQuestionIndex].answers.length, false);

    shufledList = questions[currentQuestionIndex].getShuffledAnswer();
    super.initState();
  }

  void onAnswerTap(int index, String answer) {
    setState(() {
      answerSelections = List<bool>.filled(
          questions[currentQuestionIndex].answers.length, false);
      if (currentQuestionIndex <
          questions[currentQuestionIndex].answers.length) {
        currentQuestionIndex++;
        shufledList = questions[currentQuestionIndex].getShuffledAnswer();
      }
    });
  }

  void onContinueClicked() {
    setState(() {
      answerSelections = List<bool>.filled(
          questions[currentQuestionIndex].answers.length, false);
      if (currentQuestionIndex <
          questions[currentQuestionIndex].answers.length) {
        currentQuestionIndex++;
        shufledList = questions[currentQuestionIndex].getShuffledAnswer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: SizedBox(
              width: 5,
            ),
          ),
          Text(
            questions[currentQuestionIndex].text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          ...shufledList.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final answer = entry.value;
              return AnswerItem(
                isSelected: answerSelections[index],
                answerText: answer,
                onTap: () {
                  onAnswerTap(index, answer);
                },
              );
            },
          ),
          const Expanded(
            child: SizedBox(
              width: 5,
            ),
          ),
          ElevatedButton(
            onPressed: onContinueClicked,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF6949FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                // padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                minimumSize: const Size.fromHeight(60)),
            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
