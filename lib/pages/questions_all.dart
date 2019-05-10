import 'package:flutter/material.dart';

import './question_edit.dart';
import './question_list.dart';
import './question.dart';

class QuestionsAdminPage extends StatefulWidget {
  final Function addQuestion;
  final Function deleteQuestion;
  final List<Map<String, dynamic>> questions;

  QuestionsAdminPage(this.addQuestion, this.deleteQuestion, this.questions);

  @override
  State<StatefulWidget> createState() {
    return _QuestionsAdminPageState();
  }




}
class _QuestionsAdminPageState extends State<QuestionsAdminPage>{
int _selectedIndex = 0;

Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
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
    List<Widget> _widgetOptions = <Widget>[
      QuestionEditPage(addQuestion: widget.addQuestion),
      QuestionListPage(widget.questions, widget.deleteQuestion),
      Questions(widget.questions),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Questions'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.create),
              title: Text('Create Question'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              title: Text('Edit Questions'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('all Questions'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
