// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  String userId;
  String post;

  Post({
    required this.userId,
    required this.post,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    post: json["post"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "post": post,
  };
}
