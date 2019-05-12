import 'package:flutter/material.dart';

import './questionCreatePage.dart';
import './questionremovePage.dart';
import './questionViewPage.dart';

class QuestionsNavPage extends StatefulWidget {
  final Function addQuestion;
  final Function deleteQuestion;
  final List<Map<String, dynamic>> questions;

  QuestionsNavPage(this.addQuestion, this.deleteQuestion, this.questions);

  @override
  State<StatefulWidget> createState() {
    return _QuestionsNavPageState();
  }




}
class _QuestionsNavPageState extends State<QuestionsNavPage>{
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
      QuestionCreatePage(addQuestion: widget.addQuestion),
      QuestionRemovePage(widget.questions, widget.deleteQuestion),
      QuestionsViewPage(widget.questions),
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
