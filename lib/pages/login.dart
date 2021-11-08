import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_widgets/pages/afterLogin.dart';
import 'package:flutter_widgets/utils/routes.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController =
      TextEditingController(text: "ali@gmail.com");

  final TextEditingController passwordController =
      TextEditingController(text: "asdfpassword");

  void loginFunc() async {
    //Getting values from Controllers
    final String email = emailController.text;
    final String password = passwordController.text;

    // Authentication Instance
    FirebaseAuth auth = FirebaseAuth.instance;
    // FireStroe Database Instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final DocumentSnapshot snapshot =
          await firestore.collection('users').doc(user.user!.uid).get();
      final mydata = snapshot.data();

      print("User is loged in");
      print(mydata);
      // Navigator.of(context).pushNamed(MyRoutes.afterLoginRoute);
      Navigator.pushNamed(context, MyRoutes.afterLoginRoute);
      
    } on FirebaseAuthException catch (e) {
      print(e.message);
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(title: Text(e.message.toString()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Enter Email"),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: "Enter Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightGreen)),
                      onPressed: loginFunc,
                      child: Text("Login"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
