import 'package:flutter/material.dart';

class QuestionRemovePage extends StatelessWidget {

  final Function deleteQuestion;
  final List<Map<String, dynamic>> questions;
int time;
  QuestionRemovePage(this.questions, this.deleteQuestion){


    for (var i = 0; i < 1000; i++) {
      questions.add({
        'name': 'test',
        'question': 'test',
        'age': 99.toString(),
        'image': null
      });
    }

  time = DateTime.now().millisecondsSinceEpoch;

  }

  Widget _deleteButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.delete_forever),
      onPressed: () {
        deleteQuestion(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_){print(DateTime.now().millisecondsSinceEpoch-time);});
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
              backgroundImage: questions[index]['image'] == null
                  ? null
                  : FileImage(questions[index]['image'])),
          title: Text(questions[index]['name']),
          subtitle: Text('\age: ${questions[index]['age'].toString()}'),
          trailing: _deleteButton(context, index),
        );
      },
      itemCount: questions.length,
    );
  }
}
