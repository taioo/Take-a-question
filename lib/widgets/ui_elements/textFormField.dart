import 'package:flutter/material.dart';

class TextFormFieldEditCreate extends StatefulWidget {
final Function _setText;
final String label;
//int time;

  TextFormFieldEditCreate(this._setText, this.label){
     //time = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  _TextFormFieldEditCreateState createState() => _TextFormFieldEditCreateState();
}

class _TextFormFieldEditCreateState extends State<TextFormFieldEditCreate> {

  @override
  Widget build(BuildContext context) {
//WidgetsBinding.instance.addPostFrameCallback((_){print(DateTime.now().millisecondsSinceEpoch - widget.time);});
     return TextFormField(
      decoration: InputDecoration(labelText: widget.label),
      onSaved: (String value) {
        widget._setText(widget.label , value);
      },
    );
  }
}
