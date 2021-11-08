import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/post.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AfterLogin extends StatefulWidget {
  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  
  late var myimgPath;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void pickImageFunc() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      myimgPath = image!.path;
    });
    print(image!.path);
  }

  void submitPostFunc()async{
    try{
      final title = titleController.text;
      final description = descriptionController.text;

      firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

      File file = File(myimgPath);   

      // Import the path as path
      String basename = path.basename(myimgPath);
      print(basename);

      firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref("/$basename");

      await ref.putFile(file);
      
      print("File Uploaded Successfully");

      String downloadUrl = await ref.getDownloadURL();
      print("This is your DawnloadURL: $downloadUrl");     

      // FireStroe Database Instance
      FirebaseFirestore firestore = FirebaseFirestore.instance; 
      await firestore.collection("posts").add({
        // Names should be according to post page index
        "title" : title,
        "description": description,
        "url" : downloadUrl
      });

      
      // It will clear input text after submit
      titleController.clear();
      descriptionController.clear();
       print("Have Saved in Firestore Database");


      print("title is " + title + "  Description is " + description);
    } catch(e){
      print(e);
    }
    

  }

  Stream postStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  final Stream<QuerySnapshot> _postsStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: "Enter the title"),
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: "Enter Description"),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: () => pickImageFunc(),
                      child: Text("Upload Image")),
                  ElevatedButton(
                      onPressed: () => submitPostFunc(),
                      child: Text("Submit a Post"))
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _postsStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        String postId = document.id;
                        data["postId"] = postId;
                        return Post(
                          data: data,
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
