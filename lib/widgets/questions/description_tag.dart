import 'package:flutter/material.dart';

class DescriptionTag extends StatelessWidget {
  final String description;

  DescriptionTag(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        '$description ?',
        style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
      ),
    );
  }
}
