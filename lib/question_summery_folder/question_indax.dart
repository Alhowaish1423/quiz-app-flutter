import 'package:flutter/material.dart';

class QuestionIndax extends StatelessWidget {
  const QuestionIndax(
      {super.key, required this.isCorrect, required this.questionIndaxNumber});

  final bool isCorrect;
  final int questionIndaxNumber;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndaxNumber + 1;

    return Container(

      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect
                ? const Color.fromARGB(255, 0, 255, 13)
                : const Color.fromARGB(255, 255, 0, 0)),
     child: Text(
        (questionNumber).toString(),
         ),

      
           
      
    );
  }
}
