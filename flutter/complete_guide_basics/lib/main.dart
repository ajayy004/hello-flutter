import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  var questions = [
    "What's your faviourt color?",
    "What's your faviourt animal?"
  ];

  void selectedAnswer(String answer) {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Complete Guide Basics"),
        ),
        body: Column(
          children: <Widget>[
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: () => selectedAnswer("Answer 1"),
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () => selectedAnswer("Answer 2"),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () => selectedAnswer("Answer 3"),
            )
          ],
        ),
      ),
    );
  }
}
