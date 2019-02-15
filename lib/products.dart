import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products) {
    print('[Product Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/sweets.jpeg'),
          Text(products[index])
        ],
      ),
    );
  }

  Widget _startWidget() {
    if (products.length > 0) {
      return ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      return Center(
        child: Text('plese add some products'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('[Product Widget] build()');
    return _startWidget();
  }
}
