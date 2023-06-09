import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.switchScreen, {super.key});
  final void Function(String screen) switchScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Lottie.asset(
                'assets/lotties/splash.json',
                width: 300,
                height: 300,
              ),
              Text(
                'Learn flutter whenever and wherever you want. It\'s free and forever',
                style: GoogleFonts.tiltNeon(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {
              switchScreen("questionScreen");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF6949FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                // padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                minimumSize: const Size.fromHeight(50)),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text(
              'GET STARTED',
              style: GoogleFonts.tiltNeon(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
