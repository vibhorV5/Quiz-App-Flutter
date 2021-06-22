import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import 'quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite Color?',
      'answers': [
        {'text': 'BLACK', 'score': 10},
        {'text': 'BLUE', 'score': 5},
        {'text': 'PINK', 'score': 3},
        {'text': 'ORANGE', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favourite Animal?',
      'answers': [
        {'text': 'TIGER', 'score': 8},
        {'text': 'DOG', 'score': 2},
        {'text': 'CAT', 'score': 4},
        {'text': 'LION', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your favourite Food?',
      'answers': [
        {'text': 'PIZZA', 'score': 3},
        {'text': 'BURGER', 'score': 5},
        {'text': 'RAJMA', 'score': 7},
        {'text': 'CHOLE', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s your favourite Snack?',
      'answers': [
        {'text': 'LAYS', 'score': 3},
        {'text': 'NAMKEEN', 'score': 5},
        {'text': 'MAGGIE', 'score': 7},
        {'text': 'BISCUIT', 'score': 8}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score; // _toalScore = _totalScore + score

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more Questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
        backgroundColor: Colors.blueGrey[400],
      ),
    );
  }
}
