import 'package:flutter/material.dart';

class AgeTag extends StatelessWidget {
  final int age;

  AgeTag(this.age);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        age.toString(),
        style: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
      ),
    );
  }
}
