import 'package:flutter/material.dart';

import './age_tag.dart';
import '../ui_elements/title_default.dart';

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
          TitleDefault(question['title']),
          SizedBox(
            width: 8.0,
          ),
          AgeTag(question['age'])
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Read question'),
        IconButton(
          icon: Icon(Icons.keyboard_arrow_right),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/question/' + questionIndex.toString()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.file(question['image']),
          _buildTitleageRow(),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}
