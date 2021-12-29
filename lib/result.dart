import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final String getScoreRemark;
  final VoidCallback onReset;
  
  const Result({
    Key? key,
    required this.totalScore,
    required this.getScoreRemark,
    required this.onReset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'DONE!',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 50.0,
          )
        ),
        const SizedBox(height: 15.0),
        Text(
          'Your score is $totalScore',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          )
        ),
        const SizedBox(height: 15.0),
        Text(
          'You are $getScoreRemark!',
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 30.0,
          )
        ),
        const SizedBox(height: 15.0),
        TextButton(
          onPressed: onReset,
          child: const Text(
            'Try again?',
            style: TextStyle(
              fontSize: 16.0,
            )
          ),
        ),
      ]
    );
  }
}