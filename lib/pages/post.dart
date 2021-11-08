import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/editPost.dart';

class Post extends StatelessWidget {

  final Map data;
  const Post({required this.data});


  @override
  Widget build(BuildContext context) {

    // Function For delete
    void deletePost()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance; 
        try{
          await firestore.collection("posts").doc(data["postId"]).delete();
        }catch(e){
          print(e);
        }
    }

    // Function For Edit
    void editPost(){
      showDialog(context: context,
      builder: (BuildContext context){
        return EditPost(data: data);
      });
    }

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
                  Image.network(data["url"],fit: BoxFit.cover, height: 200, width: double.infinity,),
                  SizedBox(height: 10,),
                  Text(data["title"] ?? " " , style: TextStyle(fontSize: 30),),
                  Align(child: Text(data["description"]?? "Something Wrong", style: TextStyle(fontSize: 20,) ,textAlign: TextAlign.justify,)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    ElevatedButton(onPressed: deletePost, child: Text("Delete")),
                    ElevatedButton(onPressed: editPost, child: Text("Edit")),
                  ],)
                ],),
              ),
            ),
          ),
    );
  }
}

