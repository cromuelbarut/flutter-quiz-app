import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final List<Map> items;
  final int itemCounter;
  final Function onAnswered;
  
  const Answer({
    Key? key,
    required this.items,
    required this.itemCounter,
    required this.onAnswered,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ...items[itemCounter]['answers'].map((item) {
          return ElevatedButton(
            onPressed: () => onAnswered(item['score']),
            child: Text(item['answerText']),
            style: ElevatedButton.styleFrom(),
          );
        }).toList(),
      ],
    );
  }
}