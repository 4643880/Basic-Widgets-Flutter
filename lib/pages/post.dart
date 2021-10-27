import 'package:flutter/material.dart';

class Post extends StatelessWidget {

  final Map data;
  const Post({required this.data});
  

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Image.network(data["url"],fit: BoxFit.cover,),
                  SizedBox(height: 10,),
                  Text(data["title"] ?? " " , style: TextStyle(fontSize: 30),),
                  Align(child: Text(data["description"]?? "Something Wrong", style: TextStyle(fontSize: 20,) ,textAlign: TextAlign.justify,)),
                ],),
              ),
            ),
          ),
    );
  }
}

