import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your faviourt color?",
      "answers": [
        {"text": "Black", "score": 1},
        {"text": "Red", "score": 2},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 4}
      ]
    },
    {
      "questionText": "What's your faviourt animal?",
      "answers": [
        {"text": "Cat", "score": 1},
        {"text": "Dog", "score": 2},
        {"text": "Horse", "score": 3},
        {"text": "Tiger", "score": 4}
      ]
    },
    {
      "questionText": "Who's your faviourt teacher?",
      "answers": [
        {"text": "Tech 1", "score": 1},
        {"text": "Tech 2", "score": 2},
        {"text": "Tech 3", "score": 3},
        {"text": "Tech 4", "score": 4}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _selectAnswer(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Complete Guide Basics"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                questions: _questions,
                selectAnswer: _selectAnswer,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
