import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_app_steam/product_pro.dart';
import 'package:flutter_app_steam/product_new.dart';
//import 'package:flutter_app_steam/count_bloc.dart';

import 'package:flutter_app_steam/fn_count_bloc.dart';
import 'package:flutter_app_steam/generic_bloc_provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  FnCountBloc fnCountBloc;

  int currentIndex = 0;
  List pages = [ProductProPage(), ProductNewPage()];

  @override
  Widget build(BuildContext context) {

    fnCountBloc = BlocProvider.of(context);

    Widget bottomNavBar = BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant_photo),
              title: Text('โปร')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('ใหม่')
          )
        ]
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Home"),
          actions: <Widget>[
            IconButton(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                icon: Stack(
                  children: <Widget>[
                    Icon(Icons.shopping_cart, size: 40,),
                    Positioned(
                      right: 0,
                      child: StreamBuilder(
                            initialData: 0,
                            stream: fnCountBloc.counterStream,
                            builder: (BuildContext context, snapshot) => Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Text(
                                '${snapshot.data}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ),
                    ),
                  ],
                ),
                onPressed: (){

                }
            )
          ],
        ),
        body: pages[currentIndex],
        bottomNavigationBar: bottomNavBar,
      );
  }

}
