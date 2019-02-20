import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/ui_elements/title_default.dart';

class QuestionPage extends StatelessWidget {
  final String title;
  final File image;
  final int age;
  final String description;

 QuestionPage(this.title, this.image, this.age, this.description);

  Widget _buildAddressageRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '\age:' + age.toString(),
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            Image.file(image),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(title),
            ),
            _buildAddressageRow(),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
