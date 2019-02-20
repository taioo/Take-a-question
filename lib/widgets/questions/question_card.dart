import 'package:flutter/material.dart';

import './age_tag.dart';
import '../ui_elements/title_default.dart';

class QuestionCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  QuestionCard(this.product, this.productIndex);

  Widget _buildTitleageRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product['title']),
          SizedBox(
            width: 8.0,
          ),
          AgeTag(product['age'].toString())
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Read question'),
        IconButton(
          icon: Icon(Icons.keyboard_arrow_right),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + productIndex.toString()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.file(product['image']),
          _buildTitleageRow(),
          _buildActionButtons(context)
        ],
      ),
    );
    ;
  }
}
