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
          child: ListView.builder(
            itemCount: 20,
              itemBuilder: (BuildContext context, int index){
              return Container(
                child: Column(
                  children: [
                    buildContainerTile(Colors.red),
                    buildContainerTile(Colors.green),
                    buildContainerTile(Colors.blue)
                  ],
                ),
              );
              }
          ),
        ),
      ),
    );
  }

  buildContainerTile(Color color) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Container(
                  height: 100,
                  width: double.infinity,
                  color: color,
                ),
      ),
    );
  }
}

