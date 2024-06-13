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

  List<int> userIds = [];
  List<int> postIds = [];
  List<String> titles = [];
  List<String> bodies = [];

  List<String> draftTitles = [];
  List<String> draftBodies = [];
  List<int> draftPosts = [];

  String? titleError;
  String? bodyError;

  final secureStorage = const FlutterSecureStorage();

  PostProvider() {
    getAllPosts();
    retrievePostFromStorage();
  }

  getAllPosts() async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);

    posts = await PostApi().getAllPosts();
    storePost(posts);

    EasyLoading.dismiss();
    notifyListeners();
  }

  void toggleTitleError(bool isEmpty) {
    if (isEmpty) {
      titleError = "Title cannot be empty";
    } else {
      titleError = null;
    }
    notifyListeners();
  }

  void toggleBodyError(bool isEmpty) {
    if (isEmpty) {
      bodyError = "Body cannot be empty";
    } else {
      bodyError = null;
    }
    notifyListeners();
  }

  toggleFavoritePost(int id) async {
    if (favoritePostIds.contains(id)) {
      favoritePostIds.remove(id);
    } else {
      favoritePostIds.add(id);
    }
    // if (favoritePostIds.contains(id)) {
    //   favoritePostIds.remove(id);
    // } else {
    //   favoritePostIds.add(id);
    // }
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

  storePost(List<Post> posts) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    for (var post in posts) {
      postIds.add(post.id);
      userIds.add(post.userId);
      titles.add(post.title);
      bodies.add(post.body);
    }

    await secureStorage.write(
        key: "probi_posts",
        value: jsonEncode({
          "postIds": postIds,
          "userIds": userIds,
          "titles": titles,
          "bodies": bodies,
        }));

    Logger().i(
        "Store Post\nPost Id: $postIds\nUser Id: $userIds\nTitles: $titles\nBody: $bodies");

    EasyLoading.dismiss();
  }

  retrievePostFromStorage() async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    final dataString = await secureStorage.read(key: 'probi_posts');
    if (dataString != null) {
      final data = jsonDecode(dataString);
      titles.clear();
      bodies.clear();
      postIds.clear();
      userIds.clear();
      postIds.addAll(data['postIds'] as List<int>);
      userIds.addAll(data['userIds'] as List<int>);
      titles.addAll(data['titles'] as List<String>);
      bodies.addAll(data['bodies'] as List<String>);
    }

    EasyLoading.dismiss();
  }

  storeDraft() {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    bool isTitleEmpty = titleController.text.isEmpty;
    bool isBodyEmpty = bodyController.text.isEmpty;

    if (!isTitleEmpty && !isBodyEmpty) {
      draftTitles.add(titleController.text);
      draftBodies.add(bodyController.text);
    }

    titleController.clear();
    bodyController.clear();

    EasyLoading.dismiss();
  }

  draftPost(int index) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    titleController.text = draftTitles[index];
    bodyController.text = draftBodies[index];

    draftTitles.removeAt(index);
    draftBodies.removeAt(index);

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
