import 'package:flutter/material.dart';


class MyTextField extends StatefulWidget {
  const MyTextField({ Key? key }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {


  
  bool _savePassword = true;
  String myusername = "";
  TextEditingController _mycontroller = TextEditingController();

  TextEditingController _myPasswordController = TextEditingController();
  String _holdPasswordMessage = "";


  final _myFormKey = GlobalKey<FormState>();








  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Text Field"),),
        body: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(  
                          controller: _mycontroller,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2),                          
                            ),
                            hintText: "Enter the User Name Please",     
                            labelText: "Username",
                            labelStyle: TextStyle(                          
                              color: Colors.red
                            ),                      
                          ),               
          
                        ),
                        SizedBox(height: 20,),
                        TextField(       
                          obscureText: true,
                          maxLength: 3,                      
                          decoration: InputDecoration( 
                            fillColor: Colors.amber, 
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(width: 2, color: Colors.orange, style: BorderStyle.solid)
                              
                              ),
                            hintText: "Enter the Password Please",    
                            hintStyle: TextStyle(
                              
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(                          
                              color: Colors.white
                            ),                          
                          ),  
                          keyboardType: TextInputType.number      
          
                        ),
                        SizedBox(height: 20,),
                        TextField(    
                          obscureText: _savePassword,                  
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            errorText: "Something is Wrong",
                            icon: Icon(Icons.lock_clock),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  _savePassword = !_savePassword;
                                }); 
                              },
                             icon: _savePassword ? Icon(Icons.security):
                             Icon(Icons.remove_red_eye)
                             ),                                              
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2),                          
                            ),
                            hintText: "Enter the Password Please",     
                            labelText: "Password",
                            labelStyle: TextStyle(                          
                              color: Colors.red
                            ),                      
                          ),               
          
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: (){
                            print("Name" + _mycontroller.text);
                          },
                          child: Text("Submit")
                        ),
                        SizedBox(height: 20,),  






                        Text("Text Form Field Starts Here"),
                        SizedBox(height: 20,), 








                        Text("Welcome," + myusername, style: TextStyle(
                          fontSize: 30
                        ),),
                        Form(
                          key: _myFormKey,
                          child: Column(
                            children: [
                              TextFormField(   
                                validator: (value){
                                  if(value!.isEmpty){
                                   return "User Name Can't be Empty";
                                  }
                                },
                                  
                                onChanged: (value){
                                  myusername = value;
                                  setState(() {
                                    
                                  });
                                },                    
                                decoration: InputDecoration(
                                  hintText: "User Name", 
                                  labelText: "Enter the User Name", 
                                ),
                        
                              ),
                              TextFormField(
                                controller: _myPasswordController,
                                
                                decoration: InputDecoration(

                                  errorText: _holdPasswordMessage,

                                  hintText: "Enter the Password Please", 
                                  labelText: "Password", 
                                ),
                        
                              ),
                              SizedBox(height: 20,),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {

                                  print("Name" + _myPasswordController.text);


                                  if(_myPasswordController.text.length < 8){
                                    _holdPasswordMessage = "Enter Atleast 8 characters";
                                  }

                                  _myFormKey.currentState!.validate();
                                  




                                  });
                                },
                                child: Text("Submit"),
                                ),
                              SizedBox(height: 20,), 
                            ],
                          ),
                        ),
                        


                        
                                  
                      ],
                    )
                  ),
                ),
              ),
      ),
    );
  }
}