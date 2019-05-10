import 'dart:developer';

import 'package:flutter/material.dart';
import '../widgets/questions/question_card.dart';

class Questions extends StatefulWidget {
  final List<Map<String, dynamic>> questions;
  var start = 0;
  var end = 0;

  Questions(this.questions) {
    Timeline.startSync("Questions");
    // mock data
    // for (var i = 0; i < 20; i++) {
    //   questions.add({
    //     'name': 'test',
    //     'question': 'test',
    //     'age': 99.toString(),
    //     'image': null
    //   });
    // }
    
    this.start = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
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
    return _buildQuestionList();
  }

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    Timeline.finishSync();
    widget.end = DateTime.now().millisecondsSinceEpoch;
    debugPrint('######## Item: ' +
        widget.questions.length.toString() +
        ' in ListView ' +
        (widget.end - widget.start).toString() +
        ' millisecond');
  }
}
