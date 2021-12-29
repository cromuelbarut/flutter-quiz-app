import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  List<Map> items;
  final int itemCounter;
  
  Question({
    Key? key,
    required this.items,
    required this.itemCounter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      items[itemCounter]['questionText'],
      style: TextStyle(
        color: Colors.grey[400],
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      )
    );
  }
}