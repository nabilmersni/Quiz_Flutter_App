import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen(this.switchScreen, {super.key});
  final void Function(String screen) switchScreen;

  @override
  State<SplashScreen> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      // () => Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const HomePage(),
      //   ),
      // ),
      () {
        widget.switchScreen("home");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Lottie.asset(
          'assets/lotties/splash.json',
          width: 400,
          height: 400,
          fit: BoxFit.fill,
        ),
        Lottie.asset(
          'assets/lotties/loader.json',
          width: 170,
          height: 170,
        )
      ],
    );
  }
}
