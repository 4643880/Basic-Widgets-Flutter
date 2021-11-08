import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/login.dart';
import 'package:flutter_widgets/pages/register.dart';
import 'package:flutter_widgets/utils/routes.dart';

class Home  extends StatelessWidget {
  const Home ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(      
        length: 2,
         child: Scaffold(
          //  backgroundColor: Colors.orange,
           appBar: AppBar(
             backgroundColor: Colors.lightGreen,
             title: Center(child: Text("Login UI", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
             bottom: TabBar(
              //  unselectedLabelColor: Colors.red,
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
               Login(),
               Register(),
           ])  
         ),
         );
    
  }
}






