import 'dart:async';
import 'package:flutter_app_steam/generic_bloc_provider.dart';
import 'package:flutter/material.dart';

class FnCountBloc extends BlocBase {

  var counter = 0;

  StreamController streamListController = StreamController.broadcast();

  Sink get counterSink => streamListController.sink;

  Stream get counterStream => streamListController.stream;

  addCounter() {
    counterSink.add(addNum());
    print('++++++');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamListController.close();
  }

  addNum(){
    counter = counter + 1;
    return counter;
  }


}