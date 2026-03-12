import 'package:flutter/material.dart';
import 'package:second_app/data/mcq.dart';
import 'package:second_app/mcq_screen.dart';
import 'package:second_app/results_screen.dart';
import 'package:second_app/start_screen.dart';

/*
There are three extremely important (stateful) widget lifecycle methods you should be aware of:

initState(): Executed by Flutter when the StatefulWidget's State object is initialized
build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called
dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)
*/

class Quiz extends StatefulWidget {
   const Quiz({super.key});
  
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
   List<String> selectedAnswer = [];
  // this initState is excuting frist befor the build mathod . and must be in state<Quiz> class
  // here you put the inachlizing things, and excuting only ones.

  // we can remove this initState be assining the golbal varable (activeScreeen) with a value (int or string)
  /*
  @override
  void initState() {
    super.initState();
    activeScreen = 'start-screen';
  }
  */

  // this function is to change between screens,  this mathod must be in state<...> class because we are using setstate argument
  // setSate is use when any activity that will affect UI duting excution ,
  void switchScreen() {
    setState(
      () {
        activeScreen = 'McqScreen';
      },
    );
  }


  void chooseAnswer(String answer) {
    // to store all answer choosen in a list
    selectedAnswer.add(answer);


    // after the question finshed it will go back to the start secreen and will reset the list of answers choosen
    if (selectedAnswer.length == questions.length){
      
      
      setState(() {
       
        activeScreen ='Results-screen';
        // it will reset the list(user answer and the question and the correct answer ...etc) and will show nothing
        // selectedAnswer = [];
      });
    }

  }

void resetQuiz(){
  setState(() {

    activeScreen = 'start-screen';
    selectedAnswer = [];
  });

}

  @override
  Widget build(contex) {
    // this will excuate every time, and thin we change it with if statment
    // like inachlizing (if activeScreen == mcqScreen or resultsScreen do that or make it startScreen)
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'McqScreen') {
      screenWidget = McqScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'Results-screen') {
      // choosenAnswar is to so we can pass the CHOOSEN ANSWAER to (selectedAnswer form quiz class) 
      screenWidget = ResultsScreen(choosenAnswer: selectedAnswer , onReset: resetQuiz ,);
      
    }
     

  


    return MaterialApp(
      home: Scaffold(
        body: Container(
//---------------------------------------------------------------------------------------------
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // here put the order of the colors you want.
              colors: [
               
                Color.fromARGB(255, 238,50,78),
                Color.fromARGB(255, 0,82,159),
                Color.fromARGB(255,254,190,16),
              ],
            ),
          ),
// -------------------------------------------------------------------------------
          child: screenWidget,
        ),
      ),
    );
  }
}
// center -> chiled coulmn -> childern image and butting and padding
// BackGroundColor is in back_ground_color.dart file and thier you can change the background colors.//// not used
// the scaffold have two important parameters ( body ) put Container widget insied body " it is more usefull"
