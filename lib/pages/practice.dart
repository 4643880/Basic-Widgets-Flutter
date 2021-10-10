import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        abc(Colors.lightBlue, "Blue", "This is demo Description"),
        abc(Colors.lightGreen, "Green", "This is demo Description"),
        abc(Colors.grey, "Grey", "This is demo Description"),
        abc(Colors.red, "Red", "This is demo Description"),
        abc(Colors.orange, "Red", "This is demo Description")
      ],)
    );
  }

}

Widget abc(Color color, var name, var desc){
  return Container(
          color: color,
          width: 100,
           height: 150,
           child: Row(
             children: [
               Padding(
                 padding: const EdgeInsets.all(32.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                   Text(name, style: TextStyle(fontSize: 30),),
                   Text(desc, style: TextStyle(fontSize: 18),),
                 ],),
               )
             ],             
          ),
        );
}