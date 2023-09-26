import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String title;
  String description;
  String image;
  Timestamp? date;

  Post({
    required this.title,
    required this.description,
    required this.image,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'date': date,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      date: map['date'] as Timestamp?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
