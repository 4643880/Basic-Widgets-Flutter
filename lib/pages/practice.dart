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
  double coverimg_height = 250;
  double profileimg_height = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [        
          Container(
            height: coverimg_height,
            child: Image.network("https://images.unsplash.com/photo-1587620962725-abab7fe55159?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1400&q=80", fit: BoxFit.cover,),
          ),
          Positioned(            
            top: coverimg_height - profileimg_height /2,            
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100)
              ),
              
              child: CircleAvatar(
                radius: profileimg_height / 2,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/04/28/21/34/stylish-boy-2269500_1280.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}