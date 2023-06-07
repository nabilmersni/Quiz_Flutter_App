import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedAnswers, this.switchScreen, {super.key});

  final void Function(String screen) switchScreen;
  final List<String> selectedAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question': questions[i].text,
        'answer': selectedAnswers[i],
        'correct_answer': questions[i].answers[0],
        'is_correct':
            selectedAnswers[i] == questions[i].answers[0] ? true : false,
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numQuestions = questions.length;
    final numCorrectAnswer = summaryData.where((data) {
      return (data['is_correct'] as bool);
    }).length;

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              Text(
                'Congratulations',
                style: GoogleFonts.tiltNeon(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 191, 133, 254),
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'You answered $numCorrectAnswer out of $numQuestions questions correctly!',
                style: GoogleFonts.tiltNeon(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Lottie.asset(
                    'assets/lotties/congrats.json',
                  ),
                ),
                Expanded(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Lottie.asset(
                      'assets/lotties/congrats.json',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ResultsSummary(summaryData),
          const Expanded(
              child: SizedBox(
            width: 10,
          )),
          ElevatedButton.icon(
            onPressed: () {
              switchScreen("questionScreen");
              // print('object');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF6949FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                // padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                minimumSize: const Size.fromHeight(50)),
            icon: const Icon(Icons.restart_alt),
            label: Text(
              'Restart Quiz',
              style: GoogleFonts.tiltNeon(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
            ),
          ),
          const Expanded(
              child: SizedBox(
            width: 10,
          )),
        ],
      ),
    );
  }
}
