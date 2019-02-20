import 'package:flutter/material.dart';

import './question_card.dart';

class Questions extends StatelessWidget {
  final List<Map<String, dynamic>> questions;

  Questions(this.questions) {
    print('[Questions Widget] Constructor');
  }

  Widget _buildQuestionList() {
    Widget questionCards;
    if (questions.length > 0) {
      questionCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            QuestionCard(questions[index], index),
        itemCount: questions.length,
      );
    } else {
      questionCards = Container();
    }
    return questionCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Questions Widget] build()');
    return _buildQuestionList();
  }
}
