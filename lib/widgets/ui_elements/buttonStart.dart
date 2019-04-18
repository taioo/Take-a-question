import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class ButtonStart extends StatefulWidget {
  final Function submitForm;
  int Start = 0;
  int End = 0;

  ButtonStart(this.submitForm){
    this.Start = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  _ButtonStartState createState() => _ButtonStartState();
}

class _ButtonStartState extends State<ButtonStart> with AfterLayoutMixin<ButtonStart> {
  @override
  void afterFirstLayout(BuildContext context) {
   widget.End = DateTime.now().millisecondsSinceEpoch;
   debugPrint('######## button: ' + (widget.End - widget.Start).toString()+' millisecond');
  }

  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12.0)),
      color: Colors.blue,
      child: Text('Accept'),
      onPressed: widget.submitForm,
    );
  }
}
