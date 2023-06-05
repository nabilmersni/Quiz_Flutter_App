import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      body: Padding(
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
                const Text(
                  'Learn flutter whenever and wherever you want. It\'s free and forever',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
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
              child: const Text('GET STARTED'),
            )
          ],
        ),
      ),
    );
  }
}
