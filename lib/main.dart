import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(QuizzApp());

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QuizzPage());
  }
}

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {

  List<Icon> scoreKeeper = [];
  List<Question> questionBank = [
    Question(question: 'The Earth is the fourth planet from the sun.', answer: false),
    Question(question: 'The planet Venus has no moons.', answer: true),
    Question(question: 'Jupiter is composed mostly of iron.', answer: false),
    Question(question: 'The sun is a star of average size.', answer: true),
    Question(question: 'A lunar eclipse occurs when the sun passes.', answer: false)
  ];

  int currentQuestionNumber = 0;

  void changeToNextQuestion(){
    setState(() {
      if(currentQuestionNumber < questionBank.length - 1) {
        currentQuestionNumber++;
      }
      else{
        currentQuestionNumber = 0;
        scoreKeeper = [];
      }
    });
  }

  String getTextToDisplay(){
    if()
  }

  bool checkIsRightAnswerToCurrentQuestion(bool providedAnswer) =>
      questionBank[currentQuestionNumber].questionAnswer == providedAnswer ? true : false;

  void onPressAnswer(bool givenAnswer){
    bool isRightAnswerProvided = checkIsRightAnswerToCurrentQuestion(givenAnswer);
    if(isRightAnswerProvided){
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
    }else{
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
    changeToNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    questionBank[currentQuestionNumber].questionText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  onPressAnswer(true);
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: FlatButton(
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.red,
                onPressed: () {
                  onPressAnswer(false);
                },
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}
