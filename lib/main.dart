// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'result.dart';

import 'quiz.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(const MyApp());

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favourite color? ',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Red', 'score': 15},
        {'text': 'Orange', 'score': 7}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal? ',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 15},
        {'text': 'Lion', 'score': 7}
      ],
    },
    {
      'questionText': 'What\'s your favourite instructor?',
      'answers': [
        {'text': 'Ted', 'score': 10},
        {'text': 'Max', 'score': 5},
        {'text': 'Timon', 'score': 15},
        {'text': 'Simon', 'score': 7}
      ],
    },
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
    // var aBool=true;
    // aBool=false;

    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    // ignore: avoid_print
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = ['hello'];
    // dummy.add('world');
    // print(dummy);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My App'),
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
