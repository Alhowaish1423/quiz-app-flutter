import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;
//can not run the program anymore even without google fonts - I tried to not using google fonts in my code, but it still giving me errors
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(23),
      child: Center(
        child: Column(
          // to center the image vertcaly (in the midal) (start or center or end)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // the height and widgth act like unvisabl hit box of the image
            Image.asset('images/quiz-logo.png', height: 300, width: 300),

            // add padding (space) between the image and the text(an imagenary hitbox between image and text)
            const SizedBox(height: 50),

            // text
              Text(
              'Are you ready for the quiz ?',
              style: GoogleFonts.lato(
                fontSize: 50
                
              ),
              textAlign: TextAlign.center,
           ),

            // add padding (space) between the image and the text(an imagenary hitbox between image and text)
            const SizedBox(height: 30),

            // butten
            // onPressed must have a function , but we dont want to add it now so we put () {}
            //foregrundcolor for change the font color
            
            OutlinedButton(
              //this is a pointer to the swithstate function ?????
              onPressed: startQuiz,

              // for styling outlinedboutton use .styleForm
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: const Color.fromARGB(255, 85, 0, 255),
              ),
              child: const Text('start'),




              // to add icon on a button
              // child must change to label 


             /*
             
              OutlinedButton.icon(
              onPressed: () {},

              // for styling outlinedboutton use .styleForm

              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  //backgroundColor: const Color.fromARGB(255, 85, 0, 255),
              ),
              icon: const Icon(Icons.exit_to_app_sharp),
              label: const Text('start'),



              */




            ),
          ],
        ),
      ),
    );
  }
}
