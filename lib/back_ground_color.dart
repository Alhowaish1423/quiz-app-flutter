


// did not finish yet 
// need more fix
// this file is nott required 




import 'package:flutter/material.dart';

class BackGroundColor extends StatelessWidget {
  const BackGroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // here put the order of the colors you want.
          colors: [
            Color.fromARGB(255, 211, 234, 7),
            Color.fromARGB(255, 174, 29, 236),
            Color.fromARGB(255, 10, 225, 196)
          ],
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'back_ground_color.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            const BackGroundColor(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/quiz-logo.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}*/