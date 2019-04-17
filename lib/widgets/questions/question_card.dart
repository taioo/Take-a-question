import 'package:flutter/material.dart';

import './age_tag.dart';
import './description_tag.dart';
import '../ui_elements/name_default.dart';

class QuestionCard extends StatelessWidget {
  final Map<String, dynamic> question;
  final int questionIndex;

  QuestionCard(this.question, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.file(question['image']),
          NameDefault(question['name']),
          AgeTag(question['age']),
          DescriptionTag(question['description']),
        ],
      ),
    );
  }
}
