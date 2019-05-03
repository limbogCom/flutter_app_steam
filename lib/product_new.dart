import 'package:flutter/material.dart';
import 'package:flutter_app_steam/fn_count_bloc.dart';
import 'package:flutter_app_steam/generic_bloc_provider.dart';
import 'dart:async';

class ProductNewPage extends StatefulWidget {
  @override
  _ProductNewPageState createState() => _ProductNewPageState();
}

class _ProductNewPageState extends State<ProductNewPage> {

  FnCountBloc fnCountBloc;

  @override
  Widget build(BuildContext context) {

    fnCountBloc = BlocProvider.of(context);

    return RaisedButton(
      child: const Text('New'),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      splashColor: Colors.blueGrey,
      onPressed: () {
        // Perform some action
        fnCountBloc.addCounter();
      },
    );
  }
}
