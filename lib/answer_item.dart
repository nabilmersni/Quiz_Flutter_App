import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerItem extends StatefulWidget {
  const AnswerItem({
    super.key,
    required this.isSelected,
    required this.answerText,
    required this.onTap,
  });
  final bool isSelected;
  final String answerText;
  final VoidCallback onTap;

  @override
  State<AnswerItem> createState() {
    return _AnswerItemState();
  }
}

class _AnswerItemState extends State<AnswerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          widget.answerText,
          style: GoogleFonts.tiltNeon(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 3,
            color: widget.isSelected
                ? const Color(0Xff6949FF)
                : const Color(0Xff35383F),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: widget.isSelected
            ? const Color(0XFF1E1E31)
            : const Color(0XFF1F222A),
        contentPadding: const EdgeInsets.symmetric(vertical: 9),
        onTap: widget.onTap,
      ),
    );
  }
}
