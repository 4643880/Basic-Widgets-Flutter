import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/Text_Field.dart';
import 'package:flutter_widgets/pages/practice_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text("Text Field", style: TextStyle(fontSize: 24),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyTextField()));
                },
                ),
              SizedBox(height: 30,),
              ElevatedButton(
                child: Text("Practice Page", style: TextStyle(fontSize: 24),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PracticePage()));
                },
                ),
              SizedBox(height: 30,),
              ElevatedButton(
                child: Text("Default Tab Controller", style: TextStyle(fontSize: 24),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PracticePage()));
                },
                ),
            ],
          ),
        ),
        
      ),
    );
  }
}