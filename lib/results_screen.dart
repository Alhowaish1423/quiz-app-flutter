import 'package:flutter/material.dart';
import 'package:second_app/data/mcq.dart';

import 'package:second_app/question_summery_folder/question_summery.dart';

// import 'package:second_app/quiz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswer , required this.onReset});

  // choosenAnswar is to so we can pass the CHOOSEN ANSWAER to (selectedAnswer form quiz class)
  final List<String> choosenAnswer;
  final void Function() onReset;

  // see video no 81 
  // the perpous of this function is to make a list of the user answer and the real coreect answer and can manage between them
  // also this function is created so we can output it in the scroll part of result Screen
  List<Map<String, Object>> getSummryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'question_correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswer[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    
    final summaryData = getSummryData();
    final numberOfTotalQuestion = questions.length;
    // .where see viedo no 87 -- .where is to make a list ?? mabye
    final numberOfCorrectAnswer = summaryData.where((thedata){

      // is to return the length the the list of true answers 
      return thedata['question_correct_answer'] == thedata['user_answer'];

    }).length;

    return Container(
      
      
      margin: const EdgeInsets.all(23),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // part 1
             Text(
              'corecit answer is $numberOfCorrectAnswer and the number of answers is $numberOfTotalQuestion' ,
              style:const TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)) ,
            ),
            const SizedBox(height: 50),

            //scrole text -   pass the getsummrydata ( the list of question and answers and user answers)
            // or we can use summaryData insted of getsummrydata() because summaryData = getsummrydata()
            //  part 2
            QuestionsSummery(summaryData),

            const SizedBox(height: 50),

            //button - part 3
            ElevatedButton.icon(
              // excute the onReset function that is provided as a parameter
                onPressed: onReset,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Restart'))
          ],
        ),
      ),
    );
  }
}
