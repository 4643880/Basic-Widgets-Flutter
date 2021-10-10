import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
      drawer: Container(
        child: Drawer(        
          child: Container(
            color: Colors.deepPurple,
            child: ListView(children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple
                ),
                currentAccountPicture: CircleAvatar(                  
                  backgroundImage: NetworkImage("https://bit.ly/3ap5EX7"),
                ),
                accountName: Text("Your Account Name"),
                accountEmail: Text("Email@gmail.com"),),
                Divider(height: 2,thickness: 2,color: Colors.white,),
               ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text("Home", textScaleFactor: 1.3,  style: TextStyle(color: Colors.white,),),
              ),
            ListTile(
            leading: Icon(CupertinoIcons.person, color: Colors.white,),
            title: Text("My Account", textScaleFactor: 1.3,  style: TextStyle(color: Colors.white,),),
            ),
            ListTile(
            leading: Icon(CupertinoIcons.settings, color: Colors.white,),
            title: Text("Settings", textScaleFactor: 1.3,  style: TextStyle(color: Colors.white,),),
            ),
            ],),
          ),
        ),
      ),
      
    );
  }

}




