import 'package:flutter/material.dart';

class TextFormFieldEditCreate extends StatefulWidget {
final Function _setText;
final String label;




  TextFormFieldEditCreate(this._setText, this.label);

  @override
  _TextFormFieldEditCreateState createState() => _TextFormFieldEditCreateState();
}

class _TextFormFieldEditCreateState extends State<TextFormFieldEditCreate> {
  
  


  @override
  Widget build(BuildContext context) {

     return TextFormField(
      decoration: InputDecoration(labelText: widget.label),
      onSaved: (String value) {
        widget._setText(widget.label , value);
      },
    );
  }
}
