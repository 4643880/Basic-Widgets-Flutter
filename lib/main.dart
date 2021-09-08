import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List View"),
        ),
        body: Container(
          child: ListView(
            children: [
              buildContainerTile(Colors.green),
              buildContainerTile(Colors.red),
              buildContainerTile(Colors.grey),
              buildContainerTile(Colors.amber),
              buildContainerTile(Colors.black),
              buildContainerTile(Colors.deepOrange),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainerTile(Color color) {
    return Container(
              height: 200,
              width: double.infinity,
              color: color,
            );
  }
}

