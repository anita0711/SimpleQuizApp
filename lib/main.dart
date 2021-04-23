import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 7},
        {"text": "Green", "score": 2},
        {"text": "White", "score": 1},
      ],
    },
    {
      "questionText": "What's is your favorite animal?",
      "answers": [
        {"text": "Rabit", "score": 5},
        {"text": "Horse", "score": 2},
        {"text": "Elephant", "score": 4},
        {"text": "Lion", "score": 10},
      ],
    },
    {
      "questionText": "Who is your favorite student?",
      "answers": [
        {"text": "Anita", "score": 2},
        {"text": "Anu", "score": 1},
        {"text": "Ani", "score": 3},
        {"text": "Ami", "score": 2},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

void _resetQuiz() {
  setState(() {
    _questionIndex = 0;
    _totalScore = 0;
  });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
