import 'package:flutter/material.dart';

import './question_edit.dart';

class QuestionListPage extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  QuestionListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return QuestionEditPage(
                product: products[index],
                updateProduct: updateProduct,
                productIndex: index,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(products[index]['title']),
          onDismissed: (DismissDirection direction) {
            // cant delete two same question 
            deleteProduct(index);
          },
          background: Container(color: Colors.red),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: FileImage(products[index]['image'])),
                title: Text(products[index]['title']),
                subtitle: Text('\$${products[index]['price'].toString()}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider()
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
