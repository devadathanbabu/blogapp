import 'dart:convert';

import 'package:blogappfrontend/model/postmodel.dart';
import 'package:blogappfrontend/model/usermodel.dart';
import 'package:http/http.dart' as http;

class postApiService{
  Future<dynamic> createPost(
  String userId,
  String post
  )async {
    var client=http.Client();
    var apiurl=Uri.parse("http://172.16.181.241:3001/api/post/add");
    var response=await client.post(apiurl,
        headers: <String,String>{
          "Content-Type" : "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>
        {

          "userId": userId,
          "post": post

        }
        )
    );
    if(response.statusCode==200)
    {
      return jsonDecode(response.body);
    }
    else
    {
      throw Exception("Failed to send data");
    }

  }
Future<List<Post>> viewPost() async{
  var client=http.Client();
  var apiurl=Uri.parse("http://172.16.181.241:3001/api/post/viewall");
  var response=await client.get(apiurl);
  if(response.statusCode==200)
  {
    return postFromJson(response.body);
  }
else
  {
    return [];
  }
}
}
