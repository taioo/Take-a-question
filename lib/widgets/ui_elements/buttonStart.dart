import 'package:flutter/material.dart';

class ButtonStart extends StatefulWidget {
  final Function submitForm;
  int start = 0;
  int end = 0;

  ButtonStart(this.submitForm) : super(key: Key('ButtonStart')) {
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
    widget.end = DateTime.now().millisecondsSinceEpoch;
    debugPrint('######## button: ' +
        (widget.end - widget.start).toString() +
        ' millisecond');
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
