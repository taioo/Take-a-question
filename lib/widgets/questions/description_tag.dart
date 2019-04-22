import 'package:flutter/material.dart';

class DescriptionTag extends StatelessWidget {
  final String question;

  DescriptionTag(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        question,
        style: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
      ),
    );
  }
}
