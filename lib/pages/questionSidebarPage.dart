import 'package:flutter/material.dart';

import '../widgets/questions/question.dart';

class QuestionSidebarPage extends StatelessWidget {
  final List<Map<String, dynamic>> questions;

  QuestionSidebarPage(this.questions);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Questions'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
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
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[],
      ),
      body: Questions(questions),
    );
  }
}
