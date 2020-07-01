import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetQuiz;

  Result(this.score, this.resetQuiz);

  String get resultPhrase {
    String resultText;

    if (score <= 6) {
      resultText = 'You did it!';
    } else if (score <= 8) {
      resultText = 'You are awesome';
    } else {
      resultText = 'You nailed it';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36),
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
              style: TextStyle(color: Colors.blue[800]),
            ),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
