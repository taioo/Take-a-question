import 'package:flutter/material.dart';

class DescriptionTag extends StatelessWidget {
  final String description;

  DescriptionTag(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '\description: $description',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
