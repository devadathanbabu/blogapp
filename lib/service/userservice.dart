import 'dart:convert';

import 'package:http/http.dart' as http;
class userApiService{
  Future<dynamic> login(
      String eMail,
      String password) async{
        var client=http.Client();
        var apiurl=Uri.parse("http://172.16.181.241:3001/api/blog/signin");
        var response=await client.post(apiurl,
            headers: <String,String>{
              "Content-Type" : "application/json; charset=UTF-8"
            },
            body: jsonEncode(<String,String>
            {

              "eMail": eMail,
              "password": password

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

  Future<dynamic> sendData(
  String name,
  String age,
  String mobileNo,
  String address,
  String pincode,
  String eMail,
  String password) async{
    var client=http.Client();
    var apiurl=Uri.parse("http://172.16.181.241:3001/api/blog/signup");
    var response=await client.post(apiurl,
    headers: <String,String>{
      "Content-Type" : "application/json; charset=UTF-8"
    },
      body: jsonEncode(<String,String>
      {
        "name": name,
        "age": age,
        "mobileNo": mobileNo,
        "address": address,
        "pincode": pincode,
        "eMail": eMail,
        "password": password

      } )
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