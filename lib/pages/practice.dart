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
  var mylist = [1,2,3,4,5,6,7,8];
  // var myimages = ["https://bit.ly/3ap5EX7", "as"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: List.generate(mylist.length, (index) {
            return Container(
                height: 100,
                width: 100,
                color: Colors.lime,
                child: Center(child: Text(mylist[index].toString(), style: TextStyle(fontSize: 30, color: Colors.white),)),
                );            
          })
          ),
      )
    );
  }

}




