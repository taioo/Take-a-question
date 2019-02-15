import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/home.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
          brightness: Brightness.light,
<<<<<<< HEAD
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
=======
          primarySwatch: Colors.red,
          accentColor: Colors.cyan[600]),
>>>>>>> parent of 86df633... add login
      home: HomePage(),
    );
  }
}
