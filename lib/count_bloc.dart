import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_steam/fn_count_bloc.dart';
import 'package:flutter_app_steam/generic_bloc_provider.dart';

class CountBlocPage extends StatefulWidget {
  @override
  _CountBlocPageState createState() => _CountBlocPageState();

}

class _CountBlocPageState extends State<CountBlocPage> {

  FnCountBloc fnCountBloc;

  @override
  Widget build(BuildContext context) {
    fnCountBloc = BlocProvider.of(context);

    return StreamBuilder(
          stream: fnCountBloc.counterStream,
          initialData: 0,
          builder: (BuildContext context, snapshot) => Text(
              '${snapshot.data}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),
              textAlign: TextAlign.center,
          ),
    );

  }
}
