import 'package:flutter/material.dart';
import 'package:flutter_app_steam/fn_count_bloc.dart';
import 'package:flutter_app_steam/generic_bloc_provider.dart';
import 'dart:async';

import 'package:flutter_app_steam/home.dart';
import 'package:flutter_app_steam/count_bloc.dart';


class ProductProPage extends StatefulWidget {
  @override
  _ProductProPageState createState() => _ProductProPageState();
}

class _ProductProPageState extends State<ProductProPage> {

  //var counter = 0;

  FnCountBloc fnCountBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    fnCountBloc = BlocProvider.of(context);

    return RaisedButton(
      child: const Text('Add'),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      splashColor: Colors.blueGrey,
      onPressed: () {
            fnCountBloc.addCounter();

      },
    );
  }
}
