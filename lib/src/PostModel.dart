import 'package:flutter/material.dart';

class PostModel extends ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  void addPost(Post post) {
    _posts.add(post);
    notifyListeners();
  }
}

class Post {
  final String descripcion;
  final String lugar;
  final String imagen;

  Post({required this.descripcion, required this.lugar, required this.imagen});
}
