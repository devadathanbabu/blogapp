import 'package:blogappfrontend/pages/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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

            SizedBox(height: 40,),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),

                  onPressed: (){}, child: Text("Login")),
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
    );
  }
}
