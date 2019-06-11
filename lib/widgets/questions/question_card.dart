import 'package:flutter/material.dart';

import './age_tag.dart';
import './description_tag.dart';
import '../ui_elements/name_default.dart';

class QuestionCard extends StatelessWidget {
  final Map<String, dynamic> question;
  final int questionIndex;
int time = 0;

  QuestionCard(this.question, this.questionIndex){

    //time = DateTime.now().millisecondsSinceEpoch;

  }



  @override
  
  Widget build(BuildContext context) {
    //WidgetsBinding.instance.addPostFrameCallback((_){print(DateTime.now().millisecondsSinceEpoch-time);});
    return Card(
      child: Column(
        children: <Widget>[
          question['image']!=null? Image.file(question['image']):SizedBox.shrink(),
          NameDefault(question['name']),
          AgeTag(question['age']),
          DescriptionTag(question['question']),
        ],
      ),
    );
  }
}
