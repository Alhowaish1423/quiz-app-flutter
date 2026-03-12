import 'package:flutter/material.dart';

import 'package:second_app/question_summery_folder/question_indax.dart';

class SummeryItem extends StatelessWidget {
  const SummeryItem(this.thedata, {super.key});

// map not list of map
  final Map<String, Object> thedata;

  @override
  Widget build(BuildContext context) {
    final isAnswerCorrct = thedata['question_correct_answer'] == thedata['user_answer'] ;
    
    return Row(
              // to maek the question number align with the question
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // to show the question number convert the qthedata['question_index'] to int and add 1 to it (because it started form 0)
                // then convert it back to string by using .toString
                /*
                Text(
                  ((thedata['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color:  Color.fromARGB(255, 0, 0, 33)
                  ),
                ),
                */

                QuestionIndax(isCorrect: isAnswerCorrct, questionIndaxNumber: thedata['question_index']as int),

                // Expanded is used between row and column ( so that the text is not out of boundris 7dod ) video no 86
                Expanded(
                  child: Column(
                    children: [
                      // because the type of thedata['question'] is Object and the Text widget need a string
                      Text(
                        thedata['question'] as String,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        thedata['question_correct_answer'] as String,
                        style: const TextStyle(fontSize: 20),
                      ),

                      Text(
                        thedata['user_answer'] as String,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            );
  }
}
