import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_item.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.chooseAnswer, {super.key});
  final void Function(String answerSelected) chooseAnswer;
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
  bool isSelected = false;

  @override
  void initState() {
    answerSelections = List<bool>.filled(
        questions[currentQuestionIndex].answers.length, false);

    shufledList = questions[currentQuestionIndex].getShuffledAnswer();
    super.initState();
  }

  void onAnswerTap(int index, String answer) {
    setState(() {
      isSelected = true;
      answerSelections = List<bool>.filled(
          questions[currentQuestionIndex].answers.length, false);
      answerSelections[index] = !answerSelections[index];
      currentAnswer = answer;
    });
  }

  void onContinueClicked() {
    if (isSelected) {
      widget.chooseAnswer(currentAnswer);
      setState(() {
        answerSelections = List<bool>.filled(
            questions[currentQuestionIndex].answers.length, false);

        currentQuestionIndex++;
        shufledList = questions[currentQuestionIndex].getShuffledAnswer();
      });
    }
    isSelected = false;
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
            style: GoogleFonts.tiltNeon(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
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
            child: Text('Continue',
                style: GoogleFonts.tiltNeon(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
