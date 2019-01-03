/*
* basic concept of stream in flutter is it like pipe which have two sides
* one side for input data and other for output data.
* this is just basic concept you can check by yourself
* there is lot of post related to this topic.
*
* */

import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {

  @override
  MyLandingPage createState() => new MyLandingPage();

}

class MyLandingPage extends State<MyApp> {
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose() {
   _streamController.close();
   super.dispose();
  }

  int _counter = 0;
void _increment(){
  setState(() {
    _counter++;
  });
}

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Fluter is awesome',
      theme: new ThemeData(
        primarySwatch: Colors.amber
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter demo'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('you pressed the button, number will be increased'),
             StreamBuilder<int>(
               // stream is side which output the data.
               stream: _streamController.stream,
               initialData: 0,
               builder:(BuildContext context, AsyncSnapshot<int> snapshot){
                 return Text('${snapshot.data}', style: Theme.of(context).textTheme.display2);
               },
             )
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
            onPressed: (){
              // sink add where you input the data
              _streamController.sink.add(++_counter);
            },
        tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}