// this class is like a bluePrint of the botton , so we can manage all mcq bottons(shape color style ) in one file



import 'package:flutter/material.dart';

class McqButton extends StatelessWidget {
  // is anther way to make a named argument
  const McqButton({super.key, required this.mcqText, required this.onTap});

  final String mcqText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 35, 160, 255),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          // roundedrectangleborder is to make the botton border smother form [] to ()
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          // padding is the space insied the button (left right (horizontal )-- up down (vertcal))
           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
           
          
          ),
        
      child: Text(mcqText),
    );
  }
}
