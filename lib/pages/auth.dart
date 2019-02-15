import 'package:flutter/material.dart';
import './products.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Login'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('login'),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return Products();
            }));
          },
        ),
      ),
    );
  }
}
