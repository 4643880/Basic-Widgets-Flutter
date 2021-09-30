import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/Text_Field.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Text Field", style: TextStyle(fontSize: 24),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyTextField()));
              },
              ),
          ],
        ),
      ),
      
    );
  }
}