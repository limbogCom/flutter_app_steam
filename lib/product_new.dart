import 'package:flutter/material.dart';
import 'dart:async';

class ProductNewPage extends StatefulWidget {
  @override
  _ProductNewPageState createState() => _ProductNewPageState();
}

class _ProductNewPageState extends State<ProductNewPage> {

  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      child: const Text('New'),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      splashColor: Colors.blueGrey,
      onPressed: () {
        // Perform some action
      },
    );
  }
}
