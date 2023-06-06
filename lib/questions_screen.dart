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
  bool isSelected = false;
  int currentQuestionIndex = 0;

  void tap() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
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
            currentQuestion.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          ...currentQuestion.getShuffledAnswer().map(
            (answer) {
              return AnswerItem(
                isSelected: currentQuestion.isSelected,
                answerText: answer,
              );
            },
          ),
          const Expanded(
            child: SizedBox(
              width: 5,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF6949FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                // padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                minimumSize: const Size.fromHeight(50)),
            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
