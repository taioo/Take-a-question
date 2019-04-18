import 'dart:io';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import './question_card.dart';


class Questions extends StatefulWidget {
  final List<Map<String, dynamic>> questions;

  Questions(this.questions) {

    debugPrint('questions: '+ questions.toString());
    debugPrint('######## ' + this.toString() + ' start');
  }

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions>
    with AfterLayoutMixin<Questions> {
  Widget _buildQuestionList() {
    Widget questionCards;
    if (widget.questions.length > 0) {
      print(widget.questions.length.toString() +
          ' in ListView' +
          this.toString());

      questionCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            QuestionCard(widget.questions[index], index),
        itemCount: widget.questions.length,
      );
    } else {
      questionCards = Container();
    }
    return questionCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildQuestionList();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    debugPrint('######## ' + this.toString() + ' end');
  }
}
