import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void registeredFunc() async {   

    //Getting values from Controllers
    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;

    // Authentication Instance
    FirebaseAuth auth = FirebaseAuth.instance;
    // FireStroe Database Instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try{
      final UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
      firestore.collection("users").doc(user.user!.uid).set({
        "email": email,
        "username": username,
        "password": password
      });
      print("User has Registered Successfully");
    }
    catch(e){
      print(e);
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
                    controller: usernameController,
                    decoration: InputDecoration(labelText: "Enter User Name"),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Enter Email"),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: "Enter Password"),
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     labelText: "Enter Confirm Passowrd"
                  //     ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightGreen)),
                      onPressed: registeredFunc, child: Text("Submit"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
