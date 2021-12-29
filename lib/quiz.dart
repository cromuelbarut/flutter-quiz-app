import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/answer.dart';

class Quiz extends StatelessWidget {
  final List<Map> items;
  final int itemCounter;
  final Function onAnswered;
  
  const Quiz({
    Key? key,
    required this.items,
    required this.itemCounter,
    required this.onAnswered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Question(items: items, itemCounter: itemCounter),
            const SizedBox(height: 20.0),
            Answer(
              items: items,
              itemCounter: itemCounter,
              onAnswered: onAnswered,
            ),
          ],
        );
  }
}