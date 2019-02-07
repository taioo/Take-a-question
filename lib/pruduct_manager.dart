import 'package:flutter/material.dart';

import './products.dart';

class ProductManeger extends StatefulWidget {
  final String startingProduct;

  const ProductManeger(this.startingProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductManegerState();
  }
}

class _ProductManegerState extends State<ProductManeger> {
  List<String> _products = [];

  @override
  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _products.add('Advance sweet tester');
                print(_products);
              });
            },
            child: Text('add product'),
          ),
        ),
        Products(_products)
      ],
    );
  }
}
