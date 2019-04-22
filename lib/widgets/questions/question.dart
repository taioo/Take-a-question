import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import './question_card.dart';

class Questions extends StatefulWidget {
  final List<Map<String, dynamic>> questions;
  int Start= 0;
  int End= 0;

  Questions(this.questions) {

    // mock data
    for (var i = 0; i < 20; i++) {
      questions.add({
        'name': 'test',
        'question': 'test',
        'age': 99.toString(),
        'image': null
      });
    }
    this.Start = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions>
    with AfterLayoutMixin<Questions> {
  Widget _buildQuestionList() {
    Widget questionCards;
    if (widget.questions.length > 0) {
      questionCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) => QuestionCard(widget.questions[index], index),
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
    widget.End = DateTime.now().millisecondsSinceEpoch;
    debugPrint('######## Item: '+  widget.questions.length.toString() +' in ListView ' + (widget.End - widget.Start).toString()+' millisecond');
  }
}
