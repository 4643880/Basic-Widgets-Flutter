import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/practice_page.dart';
import 'package:flutter_widgets/utils/routes.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),            
             centerTitle: true, ),
          // body: MyHomePage(),
        ),
      ),
      
      initialRoute: MyRoutes.practiceRoute,
      routes: {
        // MyRoutes.homeRoute : (context) => MyHomePage(),
        MyRoutes.practiceRoute : (context) => PracticePage(),
      },
    );
  }
}