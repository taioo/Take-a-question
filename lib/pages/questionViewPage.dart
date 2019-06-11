import 'dart:developer';

import 'package:flutter/material.dart';
import '../widgets/questions/question_card.dart';

class QuestionsViewPage extends StatefulWidget {
  final List<Map<String, dynamic>> questions;
  var time;

  QuestionsViewPage(this.questions) {
    // mock data
    // for (var i = 0; i < 100; i++) {
    //   questions.add({
    //     'name': 'test',
    //     'question': 'test',
    //     'age': 99.toString(),
    //     'image': null
    //   });
    // }
    
    time = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  _QuestionsViewPageState createState() => _QuestionsViewPageState();
}

class _QuestionsViewPageState extends State<QuestionsViewPage> {
  Widget _buildQuestionList() {
    Widget questionCards;
    if (widget.questions.length > 0) {
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
    //WidgetsBinding.instance.addPostFrameCallback((_){print(DateTime.now().millisecondsSinceEpoch-widget.time);});
    return _buildQuestionList();
  }

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
  }
}
