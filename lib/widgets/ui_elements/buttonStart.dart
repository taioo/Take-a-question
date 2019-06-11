import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class ButtonStart extends StatefulWidget {
  final Function submitForm;
//int time = 0;


  ButtonStart(this.submitForm) : super(key: Key('ButtonStart')) {
   // time = DateTime.now().millisecondsSinceEpoch;
  }


  @override
  _ButtonStartState createState() => _ButtonStartState();
}

class _ButtonStartState extends State<ButtonStart> {

  @override
  Widget build(BuildContext context) {
    //WidgetsBinding.instance.addPostFrameCallback((_){print(DateTime.now().millisecondsSinceEpoch-widget.time);});
    return RaisedButton(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(12.0)),
      color: Colors.blue,
      child: Text('Accept'),
      onPressed: widget.submitForm,
    );
  }
}
