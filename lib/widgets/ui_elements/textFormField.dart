import 'package:flutter/material.dart';

class TextFormFieldEditCreate extends StatefulWidget {
final Map<String, dynamic> question;
final Map<String, dynamic> formData;
final String text;
  int start = 0;
  int end = 0;



  TextFormFieldEditCreate(this.question, this.formData, this.text){
    this.start = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  _TextFormFieldEditCreateState createState() => _TextFormFieldEditCreateState();
}

class _TextFormFieldEditCreateState extends State<TextFormFieldEditCreate> {
  
  
  
@protected
@mustCallSuper
void initState (){
  super.initState();
   widget.end = DateTime.now().millisecondsSinceEpoch;
   debugPrint('######## TextFormField: ' + (widget.end - widget.start).toString()+' millisecond');
  }

  @override
  Widget build(BuildContext context) {

     return TextFormField(
      decoration: InputDecoration(labelText: widget.text),
      onSaved: (String value) {
        widget.formData[widget.text.toString()] = value;
      },
    );
  }
}
