import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/post.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class EditPost extends StatefulWidget {
  
  
  final Map data;
  EditPost({Key? key, required this.data}) : super(key: key); 

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {  
  late var myimgPath;
  TextEditingController titleController =  TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  titleController.text =  widget.data["title"];
  descriptionController.text = widget.data["description"];
  }
  @override
  Widget build(BuildContext context) {  

  void pickImageFunc() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      myimgPath = image!.path;
    });
    print(image!.path);
  }

  void doneFunc() async {
    try{

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
      
      Map<String, dynamic> updatePost = {
        "title" : titleController.text,
        "description": descriptionController.text,
        "url": downloadUrl
      };


      // FireStore Database Instance
      FirebaseFirestore firestore = FirebaseFirestore.instance; 
      await firestore.collection("posts").doc(widget.data["postId"]).set(updatePost);

      Navigator.of(context).pop();


    } catch(e){
      print(e);
    }
  }


    return Container(
      child: AlertDialog(
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hello How are you?"),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Enter the title"),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Enter Description"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => pickImageFunc(),
                  child: Text("Upload Image")),
              ElevatedButton(onPressed: () => doneFunc(), child: Text("Done"))
            ],
          ),
        ),
      ),
    );
  }
}
