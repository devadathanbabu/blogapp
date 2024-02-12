import 'package:blogappfrontend/service/postservice.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController txt1=new TextEditingController();
  void createpost() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String userId=preferences.getString("userId")?? "";//null checking // ""
    final response=await postApiService().createPost(
        userId,
        txt1.text
    );
    print("post"+txt1.text);
    if(response["status"]=="success")
      {
        print("Post Created");
      }
    else
      {
        print("Error");
      }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create Post"),
                    TextField(
                      controller: txt1,
                      decoration: InputDecoration(
                        hintText: "Post",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
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
                      onPressed: createpost,
                      child: Text("Create")),
                ),
                SizedBox(height: 310,),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Back to menu",
                style: TextStyle(color: Colors.black),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
