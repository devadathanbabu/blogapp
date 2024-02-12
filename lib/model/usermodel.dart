// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String name;
  String age;
  String mobileNo;
  String address;
  String pincode;
  String eMail;
  String password;

  User({
    required this.name,
    required this.age,
    required this.mobileNo,
    required this.address,
    required this.pincode,
    required this.eMail,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    age: json["age"],
    mobileNo: json["mobileNo"],
    address: json["address"],
    pincode: json["pincode"],
    eMail: json["eMail"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "mobileNo": mobileNo,
    "address": address,
    "pincode": pincode,
    "eMail": eMail,
    "password": password,
  };
}
