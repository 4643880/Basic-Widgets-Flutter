import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/Home_Page.dart';
import 'package:flutter_widgets/pages/Text_Field.dart';
import 'package:flutter_widgets/pages/login_page.dart';
import 'package:flutter_widgets/pages/register_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(      
      length: 2,
       child: Scaffold(
         backgroundColor: Colors.orange,
         appBar: AppBar(
           backgroundColor: Colors.lightGreen,
           title: Center(child: Text("Login UI", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
           bottom: TabBar(
             unselectedLabelColor: Colors.red,
             overlayColor: MaterialStateProperty.all(Colors.yellow),
             labelColor: Colors.white,
             indicatorColor: Colors.white,
             isScrollable: false,
             tabs: [
             Tab(child: Text("Login"),),
             Tab(child: Text("Register"),),            
           ],),
         ),     
         body: TabBarView(
           children: [
             LoginPage(),
             RegisterPage(),
         ])  
       ),
       );
  }

}




