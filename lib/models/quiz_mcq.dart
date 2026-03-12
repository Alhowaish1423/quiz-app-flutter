

// this is like a bluePrint of the data (questions) or like a layout of the questions

class QuizMcq {
 const QuizMcq(this.text,this.answers);

  final String text;
  final List<String> answers;




// this fucton is to sheffle(change orders) the mcq answers
  List<String> getShaffeldAnswers() {

    // must take cope of the curent by using list.of
    // we have to take cope becaues the .shuggle will also shuffle the orders in the mcq.dart calss 
    
  final shaffeldList = List.of(answers);
  shaffeldList.shuffle();
  return shaffeldList;


}

}

