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
      body:Column(
        children: [
          abc(Colors.red),
          abc(Colors.green),
          abc(Colors.blue),
          xyz(Colors.orange)
        ],
      ),
    );
  }

  Widget abc(Color color) {
    return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
            "https://cdn.pixabay.com/photo/2017/04/28/21/34/stylish-boy-2269500_960_720.jpg"
          ),),
          title: Text("Haider"),
          subtitle: Text("Hey..."),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("4:30"),
              CircleAvatar(
                 child: Text("2", style: TextStyle(color: Colors.white),),
            radius: 13,
            backgroundColor: color),
            ],
          )

        );
  }
}



Widget xyz(Color color){
  return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
            "https://cdn.pixabay.com/photo/2017/04/28/21/34/stylish-boy-2269500_960_720.jpg"
          ),),
          title: Text("Haider"),
          subtitle: Text("Hey..."),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("4:30"),
              CircleAvatar(
                child: Text("3", style: TextStyle(color: Colors.black),),
            radius: 13,
            backgroundColor: color),
            ],
          )

        );
}