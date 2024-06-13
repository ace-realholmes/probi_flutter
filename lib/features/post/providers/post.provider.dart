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
  List<int> favoritePostIds = [];

  List<int> postId = [];
  List<String> titles = [];
  List<String> bodies = [];

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

  toggleFavoritePost(int id) async {
    if (favoritePostIds.contains(id)) {
      favoritePostIds.remove(id);
    } else {
      favoritePostIds.add(id);
    }
    notifyListeners();
  }

  List<Post> get favoritePostList =>
      posts.where((post) => favoritePostIds.contains(post.id)).toList();

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
    titles.add(titleController.text);
    bodies.add(bodyController.text);
    postId.add(id!);

    await secureStorage.write(
        key: "draftPosts",
        value: jsonEncode({"title": titles, "body": bodies, "postId": postId}));

    Logger().i("Store Post\nTitle: $titles\nBody: $bodies\nPost ID: $postId");

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
      titles.clear();
      bodies.clear();
      postId.clear();
      titles.addAll(data['title'] as List<String>);
      bodies.addAll(data['body'] as List<String>);
      postId.addAll(data['postId'] as List<int>);
    }

    EasyLoading.dismiss();
  }

  draftPost(int index) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    titleController.text = titles[index];
    bodyController.text = bodies[index];

    titles.removeAt(index);
    bodies.removeAt(index);

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
