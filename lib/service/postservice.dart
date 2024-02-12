import 'dart:convert';

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

          "eMail": userId,
          "password": post

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

}
