import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/splash_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = SplashScreen(switchScreen);
    // activeScreen = ResultsScreen(selectedAnswers);
    super.initState();
  }

  void switchScreen(String screen) {
    setState(() {
      if (screen == "home") {
        activeScreen = HomePage(switchScreen);
      } else if (screen == "questionScreen") {
        selectedAnswers = [];
        activeScreen = QuestionsScreen(chooseAnswer);
      }
    });
  }

  void chooseAnswer(String answerSelected) {
    selectedAnswers.add(answerSelected);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(selectedAnswers, switchScreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF181A20),
        body: activeScreen,
      ),
    );
  }
}
