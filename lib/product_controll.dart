import 'package:flutter/material.dart';

class ProductControll extends StatelessWidget {
  final Function addProduct;

  ProductControll(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct({'titel': 'Cake', 'image':'assets/sweets.jpeg'});
      },
      child: Text('add product'),
    );
  }
}
