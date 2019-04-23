
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/start.dart';
import './pages/questions_all.dart';
import './pages/questionSidebarPage.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;

  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _questions = [];

  void _addQuestion(Map<String, dynamic> question) {
    setState(() {
      _questions.add(question);
    });
  }

  void _updateQuestion(int index, Map<String, dynamic> question) {
    setState(() {
      _questions[index] = question;
    });
  }

  void _deleteQuestion(int index) {
    setState(() {
      _questions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.red),
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => Start(),
        '/question': (BuildContext context) => QuestionSidebarPage(_questions),
        '/admin': (BuildContext context) =>
            QuestionsAdminPage(_addQuestion, _updateQuestion, _deleteQuestion, _questions),
      },

      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => QuestionSidebarPage(_questions));
      },
    );
  }
}
