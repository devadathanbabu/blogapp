import 'package:blogappfrontend/service/userservice.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController txt1=new TextEditingController();
  TextEditingController txt2=new TextEditingController();
  TextEditingController txt3=new TextEditingController();
  TextEditingController txt4=new TextEditingController();
  TextEditingController txt5=new TextEditingController();
  TextEditingController txt6=new TextEditingController();
  TextEditingController txt7=new TextEditingController();

  void sendUserData() async{
    final response =await userApiService().sendData(
        txt1.text,
        txt2.text,
        txt3.text,
        txt4.text,
        txt5.text,
        txt6.text,
        txt7.text);
    if(response["status"]=="success")
    {
      print("Successfully added");
    }
    else
    {
      print("Error");
    }
  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("BLOGIFY",
            style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white),),
          backgroundColor: Colors.black.withOpacity(0.9),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: txt1,
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      labelText: "Name",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: txt2,
                  decoration: InputDecoration(
                      hintText: "Enter Age",
                      labelText: "Age",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: txt3,
                  decoration: InputDecoration(
                      hintText: "Enter MobileNo",
                      labelText: "MobileNo",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txt4,
                  decoration: InputDecoration(
                      hintText: "Enter Adress",
                      labelText: "Adress",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: txt5,
                  decoration: InputDecoration(
                      hintText: "Enter Pincode",
                      labelText: "Pincode",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txt6,
                  decoration: InputDecoration(
                      hintText: "Enter eMail",
                      labelText: "eMail",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txt7,
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                    width: 600,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: sendUserData,
                        child: Text("Sign Up"))),
                SizedBox(height: 60,),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Back to Login",
                  style: TextStyle(color: Colors.black),))
              ],
            ),
          ),
        ),
      ),


    );
  }
}
