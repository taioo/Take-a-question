import 'package:flutter/material.dart';
import 'dart:io';
import '../widgets/questions/image.dart';
import '../widgets/ui_elements/textFormField.dart';

class QuestionCreatePage extends StatefulWidget {
  final Function addQuestion;

  final Map<String, dynamic> question;
  final int questionIndex;

  QuestionCreatePage(
      {this.addQuestion,
      this.question,
      this.questionIndex});

  @override
  State<StatefulWidget> createState() {
    return _QuestionCreatePageState();
  }
}

class _QuestionCreatePageState extends State<QuestionCreatePage> {
  final Map<String, dynamic> formData = {
    'name': null,
    'question': null,
    'age': null,
    'image': null,
  };


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


void _setText(String label,String text){
  formData[label] = text;
  print(this.formData);
}
  void _setImage(File image) {
    formData['image'] = image;
  }

  Widget _buildPageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              TextFormFieldEditCreate(_setText, 'name'),
              TextFormFieldEditCreate(_setText ,'question'),
              TextFormFieldEditCreate(_setText, 'age'),
              ImageInput(_setImage),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (widget.question == null) {
      widget.addQuestion(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = _buildPageContent(context);
    return widget.question == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Create Question'),
            ),
            body: pageContent,
          );
  }
}
