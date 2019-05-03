import 'package:flutter/material.dart';
import 'package:flutter_app_steam/generic_bloc_provider.dart';
import 'dart:async';

import 'package:flutter_app_steam/home.dart';
import 'package:flutter_app_steam/count_bloc.dart';
import 'package:flutter_app_steam/fn_count_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: FnCountBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          //routes: <String,WidgetBuilder>{
            //'/HomePage': (BuildContext context) => HomePage(),
          //},
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ),
    );
  }
}













class MyHomePage extends StatelessWidget {

  StreamController<int> _controller = StreamController<int>();

  int _seconds = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          MyTextWidget(stream: _controller.stream), //just update this widget
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: _addPressed,
                iconSize: 150.0,
              ),
              IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: ()=> _controller.add(_seconds++),
                iconSize: 150.0,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _addPressed() {

    //Navigator.pushReplacementNamed(context, '/Home');
    //somehow call _updateSeconds()
  }
}

class MyTextWidget extends StatefulWidget{

  final Stream<int> stream;

  MyTextWidget({this.stream});

  @override
  _MyTextWidgetState createState() => _MyTextWidgetState();
}

class _MyTextWidgetState extends State<MyTextWidget> {

  int secondsToDisplay = 0;

  void _updateSeconds(int newSeconds) {
    setState(() {
      secondsToDisplay = newSeconds;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.stream.listen((seconds) {
      _updateSeconds(seconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      secondsToDisplay.toString(),
      textScaleFactor: 5.0,
    );
  }
}
