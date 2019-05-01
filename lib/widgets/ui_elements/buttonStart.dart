import 'dart:developer';
import 'package:flutter/scheduler.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class ButtonStart extends StatefulWidget {
  final Function submitForm;
  int start = 0;
  int end = 0;

  ButtonStart(this.submitForm) : super(key: Key('ButtonStart')) {
    Timeline.startSync("ButtonStart");
    print(DateTime.now().millisecondsSinceEpoch.toString()+'constr');
    this.start = DateTime.now().millisecondsSinceEpoch;
  }


  @override
  _ButtonStartState createState() => _ButtonStartState();
}

class _ButtonStartState extends State<ButtonStart> {
  


  @protected
  @mustCallSuper
  void initState() {
    super.initState();

WidgetsBinding.instance.addPostFrameCallback((_) => yourFunction(context));
SchedulerBinding.instance.addPostFrameCallback((_) => yourFunction(context));
 print(DateTime.now().millisecondsSinceEpoch.toString()+'initState');
    widget.end = DateTime.now().millisecondsSinceEpoch;
    debugPrint('######## button: ' +
        (widget.end - widget.start).toString() +
        ' millisecond');
          Timeline.finishSync();
  }

yourFunction(Dynamic){
  print((DateTime.now().millisecondsSinceEpoch - widget.start).toString()+'yourFunction');
}


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(12.0)),
      color: Colors.blue,
      child: Text('Accept'),
      onPressed: widget.submitForm,
    );
  }
}
