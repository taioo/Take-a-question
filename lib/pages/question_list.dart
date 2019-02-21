import 'package:flutter/material.dart';

import './question_edit.dart';

class QuestionListPage extends StatelessWidget {
  final Function updateQuestion;
  final Function deleteQuestion;
  final List<Map<String, dynamic>> questions;

  QuestionListPage(this.questions, this.updateQuestion, this.deleteQuestion);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return QuestionEditPage(
                question: questions[index],
                updateQuestion: updateQuestion,
                questionIndex: index,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(questions[index]['name']),
          onDismissed: (DismissDirection direction) {
            // cant delete two same question 
            deleteQuestion(index);
          },
          background: Container(color: Colors.red),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: FileImage(questions[index]['image'])),
                title: Text(questions[index]['name']),
                subtitle: Text('\age: ${questions[index]['age'].toString()}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider()
            ],
          ),
        );
      },
      itemCount: questions.length,
    );
  }
}
