import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String titel;
  final String image;

  const ProductPage(this.titel, this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
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
                      child: Text('Delete'),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ))
              ],
            )));
  }
}
