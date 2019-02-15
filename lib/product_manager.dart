import 'package:flutter/material.dart';

import './products.dart';
import './product_controll.dart';

class ProductManeger extends StatefulWidget {
  final Map<String,String> startingProduct;

  ProductManeger({this.startingProduct}) {
    print('[Product_maneger  Widget] Constroctor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[Product_maneger  Widget] createState()');
    return _ProductManegerState();
  }
}

class _ProductManegerState extends State<ProductManeger> {
  List<Map<String,String>> _products = [];

  @override
  void initState() {
    print('[_ProductManegerState  State] initState()');
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(ProductManeger oldWidget) {
    print('[_ProductManegerState  State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(Map<String,String> product) {
    setState(() {
      _products.add(product);
    });
    print('_addproduct');
  }

  @override
  Widget build(BuildContext context) {
    print('[_ProductManegerState  State] build()');
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(10.0), child: ProductControll(_addProduct)),
        Expanded(child: Products(_products))
      ],
    );
  }
}
