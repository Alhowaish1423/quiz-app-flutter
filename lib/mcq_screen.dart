import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/mcq_button.dart';
import 'package:second_app/data/mcq.dart';

class McqScreen extends StatefulWidget {
  const McqScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<McqScreen> createState() {
    return _McqScreenState();
  }
}

class _McqScreenState extends State<McqScreen> {
  var activeQuestionIndix = 0;

  void nextQuestion(String selectedAnswer) {
    // widget. is to accsees any thing from the above class ( statefulwidget )
    // and also widget. is only avalible in state<...> class
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      // to go to the next question
      activeQuestionIndix = activeQuestionIndix + 1;
    });
  }

  @override
  Widget build(context) {
    final activeQuestion = questions[activeQuestionIndix];

    // the Center widget is to make the text or the background in the center and full screen background colors

    // there is an anther way to center the text or widget which is to wrap the text or coloum widget with siezbox
    // and then we use the height of wiedth to use the full secreen of the divecs.
    // we used double.inginty to use the full secreen of the divace (ipad or phone)
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        // this is to make a space around the secreen
        // margin only avalible in container widget
        // see vedio no 72 to understand the diffrece between padding and margin
        margin: const EdgeInsets.all(50),

        child: Column(
          // to center the image or text vertcaly (in the midal) (start or center or end)
          mainAxisAlignment: MainAxisAlignment.center,
          //to center the image or text horizontaly (in the midal) ,(start or center or end)= (left or center or right)
          // also you can strach the bottons to take all avalbale sepcae horzontaly by using .stretch
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text(
              // accsing the quiston
              activeQuestion.text,
              //use googleFonts.nameOfthefont()
              style: GoogleFonts.lato(
                fontSize: 50,

                // to make the font bold (thiker)
                fontWeight: FontWeight.bold,
              ),

              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 70),

            // this is to convert the questions list to widget
            // the ...  is to list[1 ,2 ,3,[4,5,6],7,8,9] to -> list [1,2,3,4,5,6,7,8,9]
            // see video no 71 to understand more
            // also is is genarate buttons dynmacly besed on the list of mcq we provied
            // try to delete one answer of the mcq.dart file and see what hapen
            ...activeQuestion.getShaffeldAnswers().map(
              (answers) {
                return McqButton(
                  mcqText: answers,

                  // we did not pass a pointer , because it have a arument function and it acsept only a pointer (function name only)
                  onTap: (){

                    nextQuestion(answers);
                  },
                );
              },
            )

            /*
        
        
            // acssising the first msq answer
            McqButton(mcqText: activeQuestion.answers[0], onTap: () {}),
        
            // space between buttons
            const SizedBox(height: 30),
        
            McqButton(mcqText: activeQuestion.answers[1], onTap: () {}),
        
            const SizedBox(height: 30),
        
            McqButton(mcqText: activeQuestion.answers[2], onTap: () {}),
        
            const SizedBox(height: 30),
        
            McqButton(mcqText: activeQuestion.answers[3], onTap: () {}),
        
            */
          ],
        ),
      ),
    );
  }
}
