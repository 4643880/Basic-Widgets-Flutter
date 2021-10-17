import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class API extends StatefulWidget {
  const API({ Key? key }) : super(key: key);

  @override
  _APIState createState() => _APIState();
}

class _APIState extends State<API> {

  // Creating Fuction for getting HttP
  getUserAPI() async {
    var myUserList = [];
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var myDecodedData = jsonDecode(response.body);

    for (var i in myDecodedData){
        MyModel obj = new MyModel(i["name"], i["username"], i["useremail"], i["company"]["name"]);
        myUserList.add(obj);        
    }

    // Function Return kar lazmi ha
    return myUserList;
 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Json API")),),
      body: FutureBuilder(
        future: getUserAPI(),
        builder: (context, AsyncSnapshot snapshot){
          if (snapshot.data == null){
            return Container(
              child: Text("Nothing in Api"),
            );          
          }
          else
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index){
                return ListTile(
                  title: Text(snapshot.data[index].myname),
                  subtitle: Text(snapshot.data[index].mycompany),
                );
              }
            );
        },        
      ),
    );
  }
}



class MyModel {
  var myname;
  var myusername;
  var myuseremail;
  var mycompany;
  MyModel(this.myname, this.myusername ,this.myuseremail, this.mycompany);
}



// Example of Catalog App
// Using Function MyloadData for init 

// myloadData() async {    
//     await Future.delayed(Duration(seconds: 5));
//       var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
//       var myDecodedData = jsonDecode(catalogJson); 
//       var productDataFromDecoded = myDecodedData["products"];

//       // Dummy list for Json Mapping
//       List<Items> mylist = List.from(productDataFromDecoded).map<Items>((item) => Items.fromMap(item)).toList();
      
//       // It's working will delete the above list later
//       MyCatalogModel.product = List.from(productDataFromDecoded).map<Items>((item) => Items.fromMap(item)).toList();
//       setState(() { }); /* Most People Search it on Stackoverflow */
//       //      

//   }

