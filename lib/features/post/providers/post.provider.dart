import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:probi_flutter/features/post/models/post.dart';
import 'package:probi_flutter/features/post/services/post.service.dart';

class PostProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  List<Post> posts = [];
  List<int> favoritePost = [];

  List<int> postId = [];
  List<String> title = [];
  List<String> body = [];

  final secureStorage = const FlutterSecureStorage();

  PostProvider() {
    getAllPosts();
  }

  getAllPosts() async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);

    posts = await PostApi().getAllPosts();

    EasyLoading.dismiss();
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
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    Post post =
        await PostApi().postPost(titleController.text, bodyController.text);

    Logger().d("Create Post Provider: $post");

    if (post.id == 11) {
      getAllPosts();
      titleController.clear();
      bodyController.clear();
    }

    EasyLoading.dismiss();
  }

  storePost(int? id) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    title.add(titleController.text);
    body.add(bodyController.text);
    postId.add(id!);

    await secureStorage.write(
        key: "draftPosts",
        value: jsonEncode({"title": title, "body": body, "postId": postId}));

    Logger().i("Store Post\nTitle: $title\nBody: $body\nPost ID: $postId");

    titleController.clear();
    bodyController.clear();
    postId.clear();

    EasyLoading.dismiss();
  }

  retrieveUserData() async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    final dataString = await secureStorage.read(key: 'draftPosts');
    if (dataString != null) {
      final data = jsonDecode(dataString);
      title.clear();
      body.clear();
      postId.clear();
      title.addAll(data['title'] as List<String>);
      body.addAll(data['body'] as List<String>);
      postId.addAll(data['postId'] as List<int>);
    }

    EasyLoading.dismiss();
  }

  draftPost(int index) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    titleController.text = title[index];
    bodyController.text = body[index];

    title.removeAt(index);
    body.removeAt(index);

    EasyLoading.dismiss();
    notifyListeners();
  }

  toUpdatePost(int id) async {
    for (var post in posts) {
      if (post.id == id) {
        titleController.text = post.title;
        bodyController.text = post.body;

        notifyListeners();
        break;
      }
    }
  }

  updatePost(int id) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    Post post = await PostApi().patchPost(id);

    Logger().d("Update Post Provider: $post");

    if (post.userId.toString().isNotEmpty || post.id.toString().isNotEmpty) {
      getAllPosts();

      titleController.clear();
      bodyController.clear();
    }

    EasyLoading.dismiss();
  }

  deletePost(int id) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    await PostApi().deletePost(id);

    EasyLoading.dismiss();
    notifyListeners();
  }
}
