import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz App',
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({ Key? key }) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int itemCounter = 0;
  int totalScore = 0;
  final List<Map> items = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        { 'answerText': 'Black', 'score': 10 },
        { 'answerText': 'Blue', 'score': 2 },
        { 'answerText': 'Green', 'score': 6 },
        { 'answerText': 'Red', 'score': 4 },
        { 'answerText': 'Yellow', 'score': 8 },
      ]
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': [
        { 'answerText': 'Traversy Media', 'score': 2 },
        { 'answerText': 'Academind', 'score': 8 },
        { 'answerText': 'Netninja', 'score': 4 },
        { 'answerText': 'Web Dev Simplified', 'score': 6 },
        { 'answerText': 'Angela', 'score': 10 },
      ]
    },
    {
      'questionText': 'What is your favorite pet?',
      'answers': [
        { 'answerText': 'Dog', 'score': 10 },
        { 'answerText': 'Goldfish', 'score': 8 },
        { 'answerText': 'Cat', 'score': 4 },
        { 'answerText': 'Hamster', 'score': 6 },
        { 'answerText': 'Tarantula', 'score': 2 },
      ]
    },
  ];

  void answerQuestion(int score) {
    setState(() {
      if(itemCounter < items.length) {
        itemCounter++;
        totalScore += score;
      }
    });
  }

  String get getScoreRemark {
    String remark = 'average';

    if(totalScore >= 0 && totalScore <= 6) remark = 'worst';
    if(totalScore >= 7 && totalScore <= 12) remark = 'worse';
    if(totalScore >= 13 && totalScore <= 18) remark = 'good';
    if(totalScore >= 19 && totalScore <= 24) remark = 'better';
    if(totalScore >= 25 && totalScore <= 30) remark = 'best';

    return remark;
  }

  void resetQuiz() {
    setState(() {
      itemCounter = 0;
      totalScore = 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Quiz App'),
        centerTitle: true,
        ),
      body: Center(
        child: itemCounter < items.length ? Quiz(
          items: items,
          itemCounter: itemCounter,
          onAnswered: answerQuestion,
        ) : Result(
          totalScore: totalScore,
          getScoreRemark: getScoreRemark,
          onReset: resetQuiz,
        ),
      ),
    );
  }
}