import 'package:flutter/material.dart';
import 'dart:io';

import '../widgets/helpers/ensure_visible.dart';
import '../widgets/questions/image.dart';

class QuestionEditPage extends StatefulWidget {
  final Function addQuestion;
  final Function updateQuestion;
  final Map<String, dynamic> question;
  final int questionIndex;

  QuestionEditPage(
      {this.addQuestion, this.updateQuestion, this.question, this.questionIndex});

  @override
  State<StatefulWidget> createState() {
    return _QuestionEditPageState();
  }
}

class _QuestionEditPageState extends State<QuestionEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'age': null,
    'image': null,
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _ageFocusNode = FocusNode();

  Widget _buildTitleTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        decoration: InputDecoration(labelText: 'Question Title'),
        initialValue: widget.question == null ? '' : widget.question['title'],
        validator: (String value) {
          if (value.isEmpty || value.length < 4) {
            return 'Title is required and should be 4+ characters long.';
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        },
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _descriptionFocusNode,
      child: TextFormField(
        focusNode: _descriptionFocusNode,
        maxLines: 4,
        decoration: InputDecoration(labelText: 'Question Description'),
        initialValue:
            widget.question == null ? '' : widget.question['description'],
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty || value.length < 4) {
            return 'Description is required and should be 4+ characters long.';
          }
        },
        onSaved: (String value) {
          _formData['description'] = value;
        },
      ),
    );
  }

  Widget _buildageTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _ageFocusNode,
      child: TextFormField(
        focusNode: _ageFocusNode,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Your Age'),
        initialValue:
            widget.question == null ? '' : widget.question['age'].toString(),
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty ||
              !RegExp(r'^(\+|-)?\d+$').hasMatch(value)) {
            return 'age is required and should be a number not bigger than 150.';
          }
        },
        onSaved: (String value) {
          _formData['age'] = int.parse(value);
        },
      ),
    );
  }

  void _setImage(File image) {
    _formData['image'] = image;
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
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildageTextField(),
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
      widget.addQuestion(_formData);
    } else {
      widget.updateQuestion(widget.questionIndex, _formData);
    }

    Navigator.pushReplacementNamed(context, '/question');
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = _buildPageContent(context);
    return widget.question == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Question'),
            ),
            body: pageContent,
          );
  }
}
