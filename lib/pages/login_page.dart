import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Login Page", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
    );
  }
}