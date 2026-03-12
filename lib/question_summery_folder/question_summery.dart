// in this class we make the scroll part of the result screen
// the scroll part is to show all the user answer and the correct answer

import 'package:flutter/material.dart';
import 'package:second_app/question_summery_folder/SummeryItem.dart';
//import 'package:second_app/question_summery_folder/SummeryItem.dart';

class QuestionsSummery extends StatelessWidget {
  const QuestionsSummery(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // tn make a fixed size box of part 2
      height: 300,
      // any thing that exsed the 300 sized box will be scrollable
      child: SingleChildScrollView(
        child: Column(
          // the .map is of type <Iterable> we have to convert it to type <List> so we use summrayData.map().toList
          children: summaryData.map(
            (thedata) {
              return SummeryItem(thedata);
            },
          ).toList(),
        ),
      ),
    );
  }
}
