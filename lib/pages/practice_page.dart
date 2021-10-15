import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/Home_Page.dart';
import 'package:flutter_widgets/pages/Text_Field.dart';
import 'package:hexcolor/hexcolor.dart';

class PracticePage  extends StatelessWidget {
  const PracticePage ({ Key? key }) : super(key: key);

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
  var text = ""; 
  var number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Counter App")),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Text : $text" , style: TextStyle(fontSize: 30,
             fontWeight: FontWeight.bold),),
             Text("Counter :  $number" , style: TextStyle(fontSize: 30,
             fontWeight: FontWeight.bold),),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  text = "1";
                });
              },
               child: Text("Make 1")),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  text = "2";
                });
              },
               child: Text("Make 2")),
               ElevatedButton(
              onPressed: (){
                setState(() {                 
                  number = number + 1;
                });
              },
               child: Text("Counter")),
          ],
        ),
      ),
    );
  }

}




