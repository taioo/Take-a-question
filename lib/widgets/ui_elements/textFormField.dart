import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class TextFormFieldEditCreate extends StatefulWidget {
final Map<String, dynamic> question;
final Map<String, dynamic> formData;
final String text;
  int Start = 0;
  int End = 0;



  TextFormFieldEditCreate(this.question, this.formData, this.text){
    this.Start = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  _TextFormFieldEditCreateState createState() => _TextFormFieldEditCreateState();
}

class _TextFormFieldEditCreateState extends State<TextFormFieldEditCreate> with AfterLayoutMixin<TextFormFieldEditCreate> {
  @override
  void afterFirstLayout(BuildContext context) {
   widget.End = DateTime.now().millisecondsSinceEpoch;
   debugPrint('######## TextFormField: ' + (widget.End - widget.Start).toString()+' millisecond');
  }

  @override
  Widget build(BuildContext context) {

     return TextFormField(
      decoration: InputDecoration(labelText: widget.text),
      initialValue: widget.question == null ? '' : widget.question[widget.text].toString(),
      onSaved: (String value) {
        widget.formData[widget.text.toString()] = value;
      },
    );
  }
}
