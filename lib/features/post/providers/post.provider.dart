import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:probi_flutter/features/post/models/post.dart';
import 'package:probi_flutter/features/post/services/navigator.service.dart';
import 'package:probi_flutter/features/post/services/post.service.dart';

class PostProvider extends ChangeNotifier {
  final NavigationService _navigationService;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  List<Post> posts = [];
  List<int> favoritePost = [];

  List<String> title = [];
  List<String> body = [];

  final secureStorage = const FlutterSecureStorage();

  PostProvider(this._navigationService) {
    getAllPosts();
  }

  getAllPosts() async {
    posts = await PostApi().getAllPosts();

    notifyListeners();
  }

  toggleFavoritePosts(int id) async {
    if (favoritePost.contains(id)) {
      favoritePost.remove(id);
    } else {
      favoritePost.add(id);
    }
    notifyListeners();
  }

  List<Post> get favoritePosts =>
      posts.where((post) => favoritePost.contains(post.id)).toList();

  createPost() async {
    var fields = {
      "userId": 11,
      "title": titleController.text,
      "body": bodyController.text
    };

    Post post =
        await PostApi().postPost(titleController.text, bodyController.text);

    Logger().d("Create Post Provider: $post");

    if (post.id == 11) {
      getAllPosts();
      titleController.clear();
      bodyController.clear();
    }
  }

  storePost() async {
    title.add(titleController.text);
    body.add(bodyController.text);

    await secureStorage.write(
        key: "draftPosts", value: jsonEncode({"title": title, "body": body}));

    Logger().d("Title Controller: ${titleController.text}");
    Logger().d("Body Controller: ${bodyController.text}");

    Logger().i("Store Post\nTitle: $title\nBody: $body");

    titleController.clear();
    bodyController.clear();
  }

  retrieveUserData() async {
    final dataString = await secureStorage.read(key: 'draftPosts');
    if (dataString != null) {
      final data = jsonDecode(dataString);
      title.clear();
      body.clear();
      title.addAll(data['title'] as List<String>);
      body.addAll(data['body'] as List<String>);
    }
  }

  draftPost(int index) async {
    titleController.text = title[index];
    bodyController.text = body[index];

    title.removeAt(index);
    body.removeAt(index);

    notifyListeners();
  }

  updatePost(int id) async {
    for (var post in posts) {
      if (post.id == id) {
        titleController.text = post.title;
        bodyController.text = post.body;

        notifyListeners();
        break;
      }
    }
  }

  deletePost(int id) async {
    await PostApi().deletePost(id);

    notifyListeners();
  }
}
