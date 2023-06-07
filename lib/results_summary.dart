import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ResultsSummary extends StatelessWidget {
  const ResultsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (data) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: (data['is_correct'] as bool)
                              ? Colors.green
                              : Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            (data['question_index'] as int).toString(),
                            style: GoogleFonts.tiltNeon(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (data['question'] as String),
                              style: GoogleFonts.tiltNeon(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'the correct answer: ${data['correct_answer'] as String}',
                              style: GoogleFonts.tiltNeon(
                                color: const Color.fromARGB(255, 103, 215, 102),
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'your answer: ${data['answer'] as String}',
                              style: GoogleFonts.tiltNeon(
                                color: const Color.fromARGB(255, 122, 195, 255),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
