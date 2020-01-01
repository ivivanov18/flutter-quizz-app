import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizz_brain.dart';

QuizzBrain quizzBrain = QuizzBrain();

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

  void onPressAnswer(bool givenAnswer, BuildContext context) {
    bool isRightAnswerProvided =
        quizzBrain.checkIsRightAnswerToCurrentQuestion(givenAnswer);
    setState(() {
      if (isRightAnswerProvided) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      if (!quizzBrain.nextQuestion()) {
        Alert(
          context: context,
          title: 'End of quizz',
          desc: 'You\'ve reached the end of the quizz. Click the button to start again',
          style: AlertStyle(
            isCloseButton: false,
          ),
          buttons: [
            DialogButton(
              child: Text(
                'Start'
              ),
              onPressed: (){
                setState(() {
                  quizzBrain.initQuizz();
                  scoreKeeper = [];
                  Navigator.pop(context);
                });
              },
            )
          ]
        ).show();
      }
    });
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
                    quizzBrain.getQuestionTextOfCurrentQuestionIndex(),
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
                  onPressAnswer(true, context);
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
                  onPressAnswer(false, context);
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
