import 'package:flutter/material.dart';

import './age_tag.dart';
import './description_tag.dart';
import '../ui_elements/name_default.dart';

class QuestionCard extends StatelessWidget {
  final Map<String, dynamic> question;
  final int questionIndex;

  QuestionCard(this.question, this.questionIndex);

  Widget _buildTitleageRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NameDefault(question['name']),
          SizedBox(
            width: 8.0,
          ),
          AgeTag(question['age']),
          
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.file(question['image']),
          _buildTitleageRow(),
          DescriptionTag(question['description']),
        ],
      ),
    );
  }
}
