import 'package:flutter/material.dart';

class NameDefault extends StatelessWidget {
  final String name;

  NameDefault(this.name);

  @override
  Widget build(BuildContext context) {
    

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(5.0)),
      
      child:
      Text(
        name,
        style: TextStyle(
          fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
      ),
    );
  }
}
