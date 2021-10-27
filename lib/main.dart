import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/afterLogin.dart';
import 'package:flutter_widgets/pages/home.dart';
import 'package:flutter_widgets/pages/login.dart';
import 'package:flutter_widgets/pages/register.dart';
import 'package:flutter_widgets/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

final Future<FirebaseApp> _initialization = Firebase.initializeApp();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text("Home"),
          //   centerTitle: true,
          // ),
          body: Bravo(),
        ),
      ),
    );
  }
}

class Bravo extends StatelessWidget {
  const Bravo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Text("Something went Wrong"),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            // home: Login(),
            initialRoute: MyRoutes.homeRoute,
            routes: {
              // "/": (context) => Home(),
              MyRoutes.homeRoute: (context) => Home(),
              MyRoutes.loginRoute: (context) => Login(),
              MyRoutes.registerRoute: (context) => Register(),
              MyRoutes.afterLoginRoute: (context) => AfterLogin(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
