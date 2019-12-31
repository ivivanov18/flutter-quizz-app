import 'package:flutter/material.dart';

void main() => runApp(QuizzApp());

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QuizzPage());
  }
}

class QuizzPage extends StatelessWidget {
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
                    'This will be the place for the question',
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
                  print('Pressed true');
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
                  print('pressed false');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
