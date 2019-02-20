import 'package:flutter/material.dart';

import './question_edit.dart';
import './question_list.dart';

class QuestionsAdminPage extends StatelessWidget {
  final Function addQuestion;
  final Function updateQuestion;
  final Function deleteQuestion;
  final List<Map<String, dynamic>> questions;

  QuestionsAdminPage(this.addQuestion, this.updateQuestion, this.deleteQuestion, this.questions);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.border_horizontal),
            title: Text('List all Questions'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/question');
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Go to Start Page'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Questions'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Question',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'Edit Questions',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            QuestionEditPage(addQuestion: addQuestion),
            QuestionListPage(questions, updateQuestion, deleteQuestion)
          ],
        ),
      ),
    );
  }
}
