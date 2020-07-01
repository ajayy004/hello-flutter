import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
    {
      "questionText": "What's your faviourt color?",
      "answers": ["Black", "Red", "Green", "White"]
    },
    {
      "questionText": "What's your faviourt animal?",
      "answers": ["Cat", "Dog", "Horse", "Tiger"]
    },
    {
      "questionText": "Who's your faviourt teacher?",
      "answers": ["Tech 1", "Tech 2", "Tech 3", "Tech 4"]
    },
  ];

  void _selectedAnswer() {
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
            Question(
              _questions[_questionIndex]['questionText'],
            ),
            ...(_questions[_questionIndex]['answers'] as List<String>)
                .map(
                  (answer) => Answer(_selectedAnswer, answer),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
