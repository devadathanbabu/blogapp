import 'package:blogappfrontend/pages/menu.dart';
import 'package:blogappfrontend/pages/signup.dart';
import 'package:blogappfrontend/service/userservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txt1=new TextEditingController();
  TextEditingController txt2=new TextEditingController();

  void loginuser() async{
    final response=await userApiService().login(
        txt1.text,
        txt2.text);
      if(response["status"]=="success")
        {
          String userId=response["userdata"]["_id"].toString();
          SharedPreferences.setMockInitialValues({});
          SharedPreferences preferences=await SharedPreferences.getInstance();
          preferences.setString("userId", userId);
          print("Login Successfull:"+userId);
          Navigator.push(context, MaterialPageRoute(builder:
              (context)=>MenuPage())
          );
        }
      else if(response["status"]=="invalid user")
        {
          print("invalid userid");
        }
      else
        {
          print("invalid password");
        }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                  ),
                  TextField(
                    controller: txt1,
                    decoration: InputDecoration(
                        hintText: "Enter your eMail",
                        border: OutlineInputBorder(
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Password",
                  ),
                  TextField(
                    controller: txt2,
                    // obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      // suffixIcon: Icon(CupertinoIcons.eye_fill),
                      border: OutlineInputBorder(
                      ),
                    ),
                  ),
        
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(CupertinoIcons.square),
                  SizedBox(width: 10,),
                  Text("Remember me"),
                  SizedBox(width: 93,),
                  Text("Forgot Password")
                ],
              ),
        
              SizedBox(height: 40,),
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
        
                    onPressed: loginuser, child: Text("Login")),
              ),
              SizedBox(height: 10,),
              SizedBox(
                  width: 600,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage("https://cdn2.hubspot.net/hubfs/53/image8-2.jpg"),
                          ),
                          SizedBox(width: 20,),
                          Text("Sign In with Google"),
                        ],
                      ))
              ),
              SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=>SignupPage()));
                  }, child: Text("Sign Up",
                    style: TextStyle(color: Colors.black),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
