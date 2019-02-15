import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('product page'),
        ),
        body: Column(
          children: <Widget>[
            Image.asset('assets/sweets.jpeg'),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('product details'),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ))
          ],
        ));
  }
}
