import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var _questions = [
    "What's your faviourt color?",
    "What's your faviourt animal?"
  ];

  void _selectedAnswer(String answer) {
    setState(() {
      _questionIndex = _questionIndex + 1;
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
            Question(_questionIndex >= _questions.length
                ? 'Done'
                : _questions[_questionIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: () => _selectedAnswer("Answer 1"),
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () => _selectedAnswer("Answer 2"),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () => _selectedAnswer("Answer 3"),
            )
          ],
        ),
      ),
    );
  }
}
